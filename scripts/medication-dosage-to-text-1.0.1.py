#!/usr/bin/env python3
"""
FHIR Medication Dosage Text Generator

This script converts FHIR medication dosage instructions into human-readable German text.
It serves as a reference implementation for the dosage text generation algorithm defined 
in the German FHIR medication dosage implementation guide.

The script supports various dosage schemas:
- FreeText: User-provided text instructions
- 4-Schema: Morning-noon-evening-night pattern (e.g., "1-0-2-0 Stück")  
- TimeOfDay: Specific times (e.g., "08:00 Uhr, 20:00 Uhr — je 1 Stück")
- DayOfWeek: Specific weekdays (e.g., "montags, mittwochs — je 2 Stück")
- Interval: Regular intervals (e.g., "alle 8 Stunden: je 1 Stück")
- Combined schemas: DayOfWeek + Time/4-Schema, Interval + Time/4-Schema

Algorithm Priority (TimingOnlyOneType constraint):
1. FreeText (has text, no timing)
2. 4-Schema (daily frequency with 'when' codes, no timeOfDay/dayOfWeek)
3. DayOfWeek (has dayOfWeek, daily period, no when/timeOfDay)
4. DayOfWeek + Time/4-Schema (has dayOfWeek + timeOfDay OR when)
5. TimeOfDay (daily period with timeOfDay, no dayOfWeek/when)
6. Interval + Time/4-Schema (non-daily period with timeOfDay OR when)
7. Interval (pure interval without when/timeOfDay/dayOfWeek)
"""

import json
import sys
import os

__version__ = "1.0.1"
__language__ = "de-DE"

class MedicationDosageTextGenerator:
    """
    Converts FHIR medication dosage instructions to German text.
    
    This class implements the reference algorithm for generating human-readable 
    dosage instructions from FHIR resources according to the German FHIR 
    medication dosage implementation guide.
    """

    # Schema type constants for clarity
    SCHEMA_FREE_TEXT = "FreeText"
    SCHEMA_4_PATTERN = "4-Schema"
    SCHEMA_TIME_OF_DAY = "TimeOfDay"
    SCHEMA_DAY_OF_WEEK = "DayOfWeek"
    SCHEMA_INTERVAL = "Interval"
    SCHEMA_DAY_TIME_COMBO = "DayOfWeek and Time/4-Schema"
    SCHEMA_INTERVAL_TIME_COMBO = "Interval and Time/4-Schema"

    # FHIR timing codes for 4-schema (morning, noon, evening, night)
    WHEN_CODES_ORDER = ['MORN', 'NOON', 'EVE', 'NIGHT']
    WHEN_CODE_TRANSLATIONS = {
        'MORN': 'morgens',
        'NOON': 'mittags',
        'EVE': 'abends',
        'NIGHT': 'zur Nacht'
    }

    # Day of week mapping
    DAY_ORDER = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
    DAY_TRANSLATIONS = {
        'mon': 'montags',
        'tue': 'dienstags',
        'wed': 'mittwochs',
        'thu': 'donnerstags',
        'fri': 'freitags',
        'sat': 'samstags',
        'sun': 'sonntags'
    }

    # Time unit translations (singular/plural)
    TIME_UNITS_SINGULAR = {
        's': 'Sekunde',
        'min': 'Minute',
        'h': 'Stunde',
        'd': 'Tag',
        'wk': 'Woche',
        'mo': 'Monat',
        'a': 'Jahr'
    }
    TIME_UNITS_PLURAL = {
        's': 'Sekunden',
        'min': 'Minuten',
        'h': 'Stunden',
        'd': 'Tage',
        'wk': 'Wochen',
        'mo': 'Monate',
        'a': 'Jahre'
    }

    def __init__(self):
        """Initialize the dosage text generator with German language settings."""
        pass

    def generate_dosage_text(self, resource):
        """
        Generate human-readable German dosage text from a FHIR resource.
        
        This is the main entry point that orchestrates the text generation process:
        1. Extract dosage instructions from the resource
        2. Determine which dosage schema applies 
        3. Generate appropriate text for that schema
        
        Args:
            resource (dict): FHIR MedicationRequest, MedicationDispense, or MedicationStatement
            
        Returns:
            str: German dosage text (e.g., "1-0-2-0 Stück" or "täglich 08:00 Uhr — je 1 Stück")
            
        Examples:
            4-Schema: "1-0-2-0 Stück"
            TimeOfDay: "täglich: 08:00 Uhr — je 1 Stück; 20:00 Uhr — je 2 Stück"
            DayOfWeek: "montags — je 1 Stück, mittwochs — je 2 Stück"
            Interval: "alle 8 Stunden: je 1 Stück"
        """
        # Step 1: Extract dosage instructions based on resource type
        dosage_instructions = self._extract_dosage_instructions(resource)
        if not dosage_instructions:
            return ""

        # Step 2: Determine which dosage schema applies (implements TimingOnlyOneType logic)
        schema_type = self._determine_dosage_schema(dosage_instructions)

        # Step 3: Generate text using the appropriate schema-specific method
        text_generators = {
            self.SCHEMA_FREE_TEXT: self._generate_freetext_schema_text,
            self.SCHEMA_4_PATTERN: self._generate_4_schema_text,
            self.SCHEMA_TIME_OF_DAY: self._generate_time_of_day_text,
            self.SCHEMA_DAY_OF_WEEK: self._generate_day_of_week_text,
            self.SCHEMA_INTERVAL: self._generate_interval_text,
            self.SCHEMA_DAY_TIME_COMBO: self._generate_dayofweek_and_time_schema_text,
            self.SCHEMA_INTERVAL_TIME_COMBO: self._generate_interval_and_time_schema_text,
        }

        generator_method = text_generators.get(schema_type)
        if generator_method:
            return generator_method(dosage_instructions)
        else:
            return f"Unbekanntes Dosierungsschema: {schema_type}"

    # ============================================================================
    # RESOURCE PROCESSING - Extract dosage data from FHIR resources
    # ============================================================================

    def _extract_dosage_instructions(self, resource):
        """
        Extract dosage instructions from different FHIR resource types.
        
        Different FHIR resources store dosage instructions in different fields:
        - MedicationRequest/MedicationDispense: dosageInstruction[]
        - MedicationStatement: dosage[]
        
        Args:
            resource (dict): FHIR resource
            
        Returns:
            list: List of dosage instruction objects
            
        Raises:
            ValueError: If resource type is not supported
        """
        resource_type = resource.get('resourceType', '')

        if resource_type in ['MedicationRequest', 'MedicationDispense']:
            return resource.get('dosageInstruction', [])
        elif resource_type == 'MedicationStatement':
            return resource.get('dosage', [])
        else:
            raise ValueError(f"Unsupported resource type: {resource_type}")

    # ============================================================================
    # SCHEMA DETECTION - Determine which dosage pattern applies
    # ============================================================================

    def _determine_dosage_schema(self, dosage_instructions):
        """
        Determine the dosage schema type based on TimingOnlyOneType constraint logic.
        
        This method implements the priority order defined in the constraint:
        1. FreeText: Has text but no timing structure
        2. 4-Schema: Daily frequency with 'when' codes only
        3. DayOfWeek: Has dayOfWeek with daily period, no timing details
        4. DayOfWeek + Time/4-Schema: DayOfWeek plus timeOfDay OR when
        5. TimeOfDay: Daily period with specific times only
        6. Interval + Time/4-Schema: Non-daily period with timeOfDay OR when  
        7. Interval: Pure interval pattern without timing details
        
        Args:
            dosage_instructions (list): List of dosage instruction objects
            
        Returns:
            str: Schema type constant (e.g., SCHEMA_4_PATTERN, SCHEMA_TIME_OF_DAY)
        """
        if not dosage_instructions:
            return "Unknown"

        # Analyze the first dosage instruction (constraint ensures consistency)
        first_dosage = dosage_instructions[0]

        # Schema 1: FreeText - has text but no structured timing
        if first_dosage.get('text') and not first_dosage.get('timing'):
            return self.SCHEMA_FREE_TEXT

        # Extract timing information for further analysis
        timing = first_dosage.get('timing', {})
        repeat_element = timing.get('repeat', {})

        # Check what timing elements are present
        has_frequency = 'frequency' in repeat_element
        has_period = 'period' in repeat_element
        has_period_unit = 'periodUnit' in repeat_element
        has_day_of_week = 'dayOfWeek' in repeat_element and repeat_element['dayOfWeek']
        has_when_codes = 'when' in repeat_element and repeat_element['when']
        has_time_of_day = 'timeOfDay' in repeat_element and repeat_element['timeOfDay']

        # Helper: Check if this is a daily pattern (period=1, periodUnit='d')
        is_daily_pattern = (repeat_element.get('period') == 1 and
                            repeat_element.get('periodUnit') == 'd')
        is_non_daily_pattern = (has_period and has_period_unit and not is_daily_pattern)

        # Schema 2: 4-Schema - daily frequency with 'when' codes only
        if (has_frequency and is_daily_pattern and has_when_codes and
            not has_time_of_day and not has_day_of_week):
            return self.SCHEMA_4_PATTERN

        # Schema 3: DayOfWeek - specific weekdays, daily period, no timing details
        if (has_day_of_week and has_frequency and has_period and has_period_unit and
            not has_when_codes and not has_time_of_day):
            return self.SCHEMA_DAY_OF_WEEK

        # Schema 4: DayOfWeek + Time/4-Schema - weekdays plus timing
        if (has_day_of_week and has_frequency and has_period and has_period_unit and
            (has_time_of_day or has_when_codes)):
            return self.SCHEMA_DAY_TIME_COMBO

        # Schema 5: TimeOfDay - daily period with specific times only
        if (has_frequency and is_daily_pattern and
            not has_day_of_week and has_time_of_day and not has_when_codes):
            return self.SCHEMA_TIME_OF_DAY

        # Schema 6: Interval + Time/4-Schema - non-daily period with timing
        if (has_frequency and has_period and has_period_unit and not has_day_of_week and
            (has_time_of_day or has_when_codes) and not is_daily_pattern):
            return self.SCHEMA_INTERVAL_TIME_COMBO

        # Schema 7: Interval - pure interval without timing details
        if (has_frequency and has_period and has_period_unit and
            not has_when_codes and not has_time_of_day and not has_day_of_week):
            return self.SCHEMA_INTERVAL

        return "Unknown"

    # ============================================================================
    # TEXT GENERATION - Schema-specific text generators
    # ============================================================================

    def _generate_4_schema_text(self, dosage_instructions):
        """
        Generate text for 4-Schema: morning-noon-evening-night pattern.
        
        The 4-Schema represents doses at four daily time points using a compact
        notation: "morning-noon-evening-night" (e.g., "1-0-2-0 Stück").
        
        Args:
            dosage_instructions (list): List containing dosage instructions with 'when' codes
            
        Returns:
            str: Formatted text like "1-0-2-0 Stück" or "für 7 Tage: 2-1-2-1 mg"
            
        Example FHIR input:
            - Dosage with when=['MORN'], doseQuantity={value: 1, unit: 'Stück'}
            - Dosage with when=['EVE'], doseQuantity={value: 2, unit: 'Stück'}
            
        Example output: "1-0-2-0 Stück"
        """
        # Initialize dose amounts for each time period (default to 0)
        dose_amounts = {code: 0 for code in self.WHEN_CODES_ORDER}
        unit_text = ""
        bounds_text = ""

        # Process each dosage instruction to extract dose amounts
        for dosage in dosage_instructions:
            timing = dosage.get('timing', {})
            repeat_element = timing.get('repeat', {})
            when_codes = repeat_element.get('when', [])

            # Extract duration bounds (should be consistent across all dosages)
            if not bounds_text:
                bounds_text = self._extract_bounds_text(dosage)

            # Extract dose quantity information
            dose_info = self._extract_dose_quantity(dosage)
            if dose_info:
                dose_value, dose_unit = dose_info
                if not unit_text:
                    unit_text = dose_unit

                # Assign dose value to each specified time period
                for when_code in when_codes:
                    if when_code in dose_amounts:
                        dose_amounts[when_code] = dose_value

        # Format as "morning-noon-evening-night" pattern
        dose_values = []
        for when_code in self.WHEN_CODES_ORDER:
            dose_value = dose_amounts[when_code]
            # Format dose value (preserve decimals only if needed)
            formatted_dose = self._format_decimal_value(dose_value)
            dose_values.append(formatted_dose)

        dose_pattern = "-".join(dose_values)

        # Add unit if available
        if unit_text:
            dose_pattern = f"{dose_pattern} {unit_text}"

        # Add bounds if present (e.g., "für 7 Tage: 1-0-2-0 Stück")
        if bounds_text:
            return f"{bounds_text}: {dose_pattern}"
        else:
            return dose_pattern

    def _generate_freetext_schema_text(self, dosage_instructions):
        """
        Generate text for FreeText schema: return user-provided text directly.
        
        For free text dosages, we simply extract and concatenate the text fields
        from all dosage instructions, preserving the original human-readable content.
        
        Args:
            dosage_instructions (list): List of dosage instructions with text fields
            
        Returns:
            str: Concatenated text from all dosage instructions
            
        Example:
            Input: [{"text": "Nach Bedarf"}, {"text": "bei Schmerzen"}]
            Output: "Nach Bedarf bei Schmerzen"
        """
        if not dosage_instructions:
            return ""

        # Extract and combine all text values
        text_parts = []
        for dosage in dosage_instructions:
            text_content = dosage.get('text', '').strip()
            if text_content:
                text_parts.append(text_content)

        return " ".join(text_parts)

    def _generate_time_of_day_text(self, dosage_instructions):
        """
        Generate text for TimeOfDay schema: specific times with doses.
        
        Creates text showing specific clock times with corresponding doses,
        formatted as German time expressions with "Uhr".
        
        Args:
            dosage_instructions (list): List with timeOfDay specifications
            
        Returns:
            str: Formatted text like "täglich: 08:00 Uhr — je 1 Stück; 20:00 Uhr — je 2 Stück"
            
        Example FHIR input:
            - timing.repeat.timeOfDay = ["08:00", "20:00"]
            - doseQuantity = {value: 1, unit: "Stück"}
            
        Example output: "täglich: 08:00 Uhr — je 1 Stück; 20:00 Uhr — je 2 Stück"
        """
        if not dosage_instructions:
            return ""

        time_dose_parts = []
        bounds_text = ""

        # Process each dosage instruction
        for dosage in dosage_instructions:
            timing = dosage.get('timing', {})
            repeat_element = timing.get('repeat', {})
            time_of_day_list = repeat_element.get('timeOfDay', [])

            # Extract duration bounds (should be consistent across all dosages)
            if not bounds_text:
                bounds_text = self._extract_bounds_text(dosage)

            if not time_of_day_list:
                continue

            # Format times as German time expressions (sort chronologically)
            formatted_times = []
            for time_value in sorted(time_of_day_list):
                formatted_time = self._format_time_german(time_value)
                formatted_times.append(formatted_time)

            # Extract dose information
            dose_text = self._extract_dose_text_with_prefix(dosage)

            # Combine times and dose for this instruction
            if formatted_times and dose_text:
                times_combined = ", ".join(formatted_times)
                time_dose_parts.append(f"{times_combined} — {dose_text}")

        if not time_dose_parts:
            return ""

        # Combine multiple time-dose pairs with semicolons
        combined_instructions = "; ".join(time_dose_parts)

        # Build final text with bounds and daily indicator
        if bounds_text:
            return f"{bounds_text} täglich: {combined_instructions}"
        else:
            return f"täglich: {combined_instructions}"

    # ============================================================================
    # UTILITY METHODS - Reusable functions for data extraction and formatting
    # ============================================================================

    def _extract_dose_quantity(self, dosage):
        """
        Extract dose quantity and unit from a dosage instruction.
        
        Args:
            dosage (dict): Single dosage instruction
            
        Returns:
            tuple: (dose_value, unit) or None if no dose found
            
        Example:
            Input: {"doseAndRate": [{"doseQuantity": {"value": 2, "unit": "Stück"}}]}
            Output: (2, "Stück")
        """
        dose_and_rate = dosage.get('doseAndRate', [])
        if not dose_and_rate:
            return None

        first_dose = dose_and_rate[0]
        dose_quantity = first_dose.get('doseQuantity')
        if not dose_quantity:
            return None

        dose_value = dose_quantity.get('value', 0)
        unit = dose_quantity.get('unit', '')
        return (dose_value, unit)

    def _extract_dose_text_with_prefix(self, dosage):
        """
        Extract dose as German text with 'je' prefix.
        
        Args:
            dosage (dict): Single dosage instruction
            
        Returns:
            str: Formatted dose like "je 1 Stück" or "" if no dose
        """
        dose_info = self._extract_dose_quantity(dosage)
        if not dose_info:
            return ""

        dose_value, unit = dose_info
        formatted_dose = self._format_decimal_value(dose_value)

        if unit:
            return f"je {formatted_dose} {unit}"
        else:
            return f"je {formatted_dose}"

    def _extract_bounds_text(self, dosage):
        """
        Extract duration bounds as German text.
        
        Args:
            dosage (dict): Single dosage instruction
            
        Returns:
            str: Formatted bounds like "für 7 Tage" or "" if no bounds
        """
        timing = dosage.get('timing', {})
        repeat_element = timing.get('repeat', {})
        bounds_duration = repeat_element.get('boundsDuration')

        if not bounds_duration:
            return ""

        duration_value = bounds_duration.get('value', 0)
        duration_unit = bounds_duration.get('code', '')

        if duration_value and duration_unit:
            # Format duration value with German decimal separator
            formatted_value = self._format_decimal_value(duration_value)
            # Format duration with proper German unit
            formatted_unit = self._format_time_unit_german(duration_value, duration_unit)
            return f"für {formatted_value} {formatted_unit}"

        return ""

    def _format_decimal_value(self, value):
        """
        Format a numeric value with German decimal separator (comma).
        Removes unnecessary decimal places for whole numbers.
        
        Args:
            value (float/int): Numeric value
            
        Returns:
            str: Formatted value (e.g., "1" instead of "1,0", "1,5" kept as is)
        """
        if value == int(value):
            return str(int(value))
        else:
            # Use comma as decimal separator for German format
            return str(value).replace('.', ',')

    def _format_time_german(self, time_string):
        """
        Format time string to German format with 'Uhr'.
        
        Args:
            time_string (str): Time in format "HH:MM" or "HH:MM:SS"
            
        Returns:
            str: German time format like "08:00 Uhr"
            
        Example:
            Input: "08:30"
            Output: "08:30 Uhr"
        """
        try:
            # Extract hour and minute from time string
            time_parts = time_string.split(':')
            hour = int(time_parts[0])
            minute = time_parts[1] if len(time_parts) > 1 else '00'
            return f"{hour:02d}:{minute} Uhr"
        except (ValueError, IndexError):
            # Fallback: return original string if parsing fails
            return time_string

    def _format_time_unit_german(self, value, unit):
        """
        Format time unit with proper German singular/plural form.
        
        Args:
            value (int/float): Numeric value 
            unit (str): FHIR time unit code (s, min, h, d, wk, mo, a)
            
        Returns:
            str: German unit name (e.g., "Tag" vs "Tage")
        """
        # Choose singular or plural based on value
        unit_dict = self.TIME_UNITS_SINGULAR if value == 1 else self.TIME_UNITS_PLURAL
        return unit_dict.get(unit, unit)  # Fallback to original unit if not found

    def _generate_day_of_week_text(self, dosage_instructions):
        """
        Generate text for DayOfWeek schema: specific weekdays with doses.
        
        Creates text showing which days of the week to take medication,
        with doses specified for each day.
        
        Args:
            dosage_instructions (list): List with dayOfWeek specifications
            
        Returns:
            str: Formatted text like "montags — je 1 Stück, mittwochs — je 2 Stück"
            
        Example FHIR input:
            - timing.repeat.dayOfWeek = ["mon", "wed"]
            - doseQuantity = {value: 1, unit: "Stück"}
            
        Example output: "montags — je 1 Stück, mittwochs — je 2 Stück"
        """
        if not dosage_instructions:
            return ""

        # Group dosages by day and collect dose information
        day_to_dose = {}  # day_code -> dose_value
        bounds_text = ""
        unit_text = ""

        for dosage in dosage_instructions:
            timing = dosage.get('timing', {})
            repeat_element = timing.get('repeat', {})
            day_codes = repeat_element.get('dayOfWeek', [])

            # Extract duration bounds (should be consistent across dosages)
            if not bounds_text:
                bounds_text = self._extract_bounds_text(dosage)

            # Extract dose information
            dose_info = self._extract_dose_quantity(dosage)
            if dose_info:
                dose_value, dose_unit = dose_info
                if not unit_text:
                    unit_text = dose_unit

                # Associate this dose with each specified day
                for day_code in day_codes:
                    day_to_dose[day_code] = dose_value

        if not day_to_dose:
            return ""

        # Sort days by weekday order and format each day
        sorted_days = sorted(day_to_dose.keys(),
                             key=lambda day: self.DAY_ORDER.index(day) if day in self.DAY_ORDER else 99)

        day_text_parts = []
        for day_code in sorted_days:
            dose_value = day_to_dose[day_code]

            # Get German day name
            day_name = self.DAY_TRANSLATIONS.get(day_code, day_code)

            # Format dose value and create day entry
            formatted_dose = self._format_decimal_value(dose_value)
            dose_text = f"je {formatted_dose}"
            if unit_text:
                dose_text += f" {unit_text}"

            day_text_parts.append(f"{day_name} — {dose_text}")

        # Combine all days with semicolons (each day is a complete dosage instruction with unit)
        combined_days = "; ".join(day_text_parts)

        # Add bounds if present
        if bounds_text:
            return f"{bounds_text}: {combined_days}"
        else:
            return combined_days

    def _generate_interval_text(self, dosage_instructions):
        """
        Generate text for Interval schema: regular time intervals.
        
        Creates text showing regular dosing intervals like "every 8 hours".
        For interval schema, there should only be one dosage instruction.
        
        Args:
            dosage_instructions (list): List containing single interval dosage
            
        Returns:
            str: Formatted text like "alle 8 Stunden: je 1 Stück" or "wöchentlich: je 2 mg"
            
        Example FHIR input:
            - timing.repeat.frequency = 3, period = 1, periodUnit = "d"
            - doseQuantity = {value: 1, unit: "Stück"}
            
        Example output: "3 x täglich: je 1 Stück"
        """
        if not dosage_instructions:
            return ""

        # For interval schema, use the first (and typically only) dosage
        dosage = dosage_instructions[0]

        # Generate frequency description (e.g., "täglich", "alle 8 Stunden")
        frequency_text = self._generate_frequency_description(dosage)

        # Extract dose information
        dose_text = self._extract_dose_text_with_prefix(dosage)

        # Extract bounds if present
        bounds_text = self._extract_bounds_text(dosage)

        # Combine parts: [bounds] frequency: dose
        text_parts = []
        if bounds_text:
            text_parts.append(bounds_text)
        if frequency_text:
            text_parts.append(frequency_text)

        left_side = " ".join(text_parts)

        # Format final text
        if left_side and dose_text:
            return f"{left_side}: {dose_text}"
        elif left_side:
            return left_side
        elif dose_text:
            return dose_text
        else:
            return ""

    def _generate_frequency_description(self, dosage):
        """
        Generate German frequency description from dosage timing.
        
        Converts FHIR frequency/period/periodUnit into German text like:
        - "täglich" (daily)
        - "3 x täglich" (3 times daily)  
        - "alle 8 Stunden" (every 8 hours)
        - "wöchentlich" (weekly)
        
        Args:
            dosage (dict): Single dosage instruction with timing
            
        Returns:
            str: German frequency description
        """
        timing = dosage.get('timing', {})
        repeat_element = timing.get('repeat', {})

        frequency = repeat_element.get('frequency')
        period = repeat_element.get('period')
        period_unit = repeat_element.get('periodUnit')

        # Handle missing timing information
        if frequency is None and period is None and period_unit is None:
            return ""

        # Daily patterns (periodUnit='d', period=1)
        if period_unit == 'd' and period == 1:
            if frequency == 1:
                return "täglich"
            else:
                return f"{frequency} x täglich"

        # Weekly patterns (periodUnit='wk', period=1)
        if period_unit == 'wk' and period == 1:
            if frequency == 1:
                return "wöchentlich"
            else:
                return f"{frequency} x wöchentlich"

        # Interval patterns (frequency=1 with various periods)
        if frequency == 1:
            period_description = self._format_period_description(period, period_unit)
            return f"alle {period_description}"

        # Complex patterns (frequency > 1 with intervals)
        frequency_text = f"{frequency} x"
        period_description = self._format_period_description(period, period_unit)
        return f"{frequency_text} alle {period_description}"

    def _format_period_description(self, period, period_unit):
        """
        Format a period with unit into German description.
        
        Args:
            period (int/float): Numeric period value
            period_unit (str): FHIR period unit code
            
        Returns:
            str: German period description like "3 Tage" or "2 Wochen"
        """
        formatted_period = self._format_decimal_value(period)
        unit_name = self._format_time_unit_german(period, period_unit)
        return f"{formatted_period} {unit_name}"

    def _generate_dayofweek_and_time_schema_text(self, dosage_instructions):
        """
        Generate text for DayOfWeek + Time/4-Schema combination.
        
        This combines specific weekdays with either timeOfDay or when codes.
        The method determines which sub-type applies and delegates to the 
        appropriate specialized generator.
        
        Args:
            dosage_instructions (list): List with both dayOfWeek and timing info
            
        Returns:
            str: Formatted combination text
            
        Sub-types:
        - DayOfWeek + TimeOfDay: "montags 08:00 Uhr — je 1 Stück, mittwochs 20:00 Uhr — je 2 Stück"
        - DayOfWeek + When: "montags 1-0-1-0, mittwochs 2-1-2-0 Stück"
        """
        if not dosage_instructions:
            return ""

        # Check whether this uses timeOfDay or when codes
        first_dosage = dosage_instructions[0]
        timing = first_dosage.get('timing', {})
        repeat_element = timing.get('repeat', {})

        has_time_of_day = 'timeOfDay' in repeat_element and repeat_element['timeOfDay']
        has_when_codes = 'when' in repeat_element and repeat_element['when']

        # Delegate to appropriate sub-type generator
        if has_time_of_day and not has_when_codes:
            return self._generate_dayofweek_timeofday_combination(dosage_instructions)
        elif has_when_codes:  # Handle when codes (with or without timeOfDay)
            return self._generate_dayofweek_when_combination(dosage_instructions)
        else:
            # Fallback to when-based logic if neither present
            return self._generate_dayofweek_when_combination(dosage_instructions)

    def _generate_dayofweek_timeofday_combination(self, dosage_instructions):
        """
        Generate text for DayOfWeek + TimeOfDay combination.
        
        Example output: "montags 08:00 Uhr — je 1 Stück, mittwochs 20:00 Uhr — je 2 Stück"
        """
        if not dosage_instructions:
            return ""

        # Group dosages by day of week
        day_to_dosages = {}  # day_code -> list of dosages
        bounds_text = ""

        for dosage in dosage_instructions:
            timing = dosage.get('timing', {})
            repeat_element = timing.get('repeat', {})
            day_codes = repeat_element.get('dayOfWeek', [])

            # Extract bounds (should be consistent across dosages)
            if not bounds_text:
                bounds_text = self._extract_bounds_text(dosage)

            # Group dosages by day
            for day_code in day_codes:
                if day_code not in day_to_dosages:
                    day_to_dosages[day_code] = []
                day_to_dosages[day_code].append(dosage)

        # Format each day with its time-dose combinations
        sorted_days = sorted(day_to_dosages.keys(),
                             key=lambda day: self.DAY_ORDER.index(day) if day in self.DAY_ORDER else 99)

        day_text_parts = []
        for day_code in sorted_days:
            day_dosages = day_to_dosages[day_code]
            day_name = self.DAY_TRANSLATIONS.get(day_code, day_code)

            # Generate time-dose combinations for this day
            time_dose_parts = []
            for dosage in day_dosages:
                timing = dosage.get('timing', {})
                repeat_element = timing.get('repeat', {})
                time_list = repeat_element.get('timeOfDay', [])

                if not time_list:
                    continue

                # Format times (sort chronologically)
                formatted_times = []
                for time_value in sorted(time_list):
                    formatted_time = self._format_time_german(time_value)
                    formatted_times.append(formatted_time)

                # Extract dose information
                dose_text = self._extract_dose_text_with_prefix(dosage)

                # Combine times and dose for this dosage
                if formatted_times and dose_text:
                    times_combined = ", ".join(formatted_times)
                    time_dose_parts.append(f"{times_combined} — {dose_text}")

            # Combine all time-dose parts for this day
            if time_dose_parts:
                combined_times = "; ".join(time_dose_parts)
                day_text_parts.append(f"{day_name} {combined_times}")

        # Combine all days with semicolons (each day is a complete dosage instruction with unit)
        combined_days = "; ".join(day_text_parts)

        # Add bounds if present
        if bounds_text:
            return f"{bounds_text}: {combined_days}"
        else:
            return combined_days

    def _generate_dayofweek_when_combination(self, dosage_instructions):
        """
        Generate text for DayOfWeek + When combination (4-Schema pattern per day).
        
        Example output: "montags 1-0-1-0, mittwochs 2-1-2-0 Stück"
        """
        if not dosage_instructions:
            return ""

        # Group dosages by day and build 4-schema pattern for each day
        day_to_patterns = {}  # day_code -> {MORN: dose, NOON: dose, EVE: dose, NIGHT: dose}
        bounds_text = ""
        unit_text = ""

        for dosage in dosage_instructions:
            timing = dosage.get('timing', {})
            repeat_element = timing.get('repeat', {})

            day_codes = repeat_element.get('dayOfWeek', [])
            when_codes = repeat_element.get('when', [])

            # Extract bounds (should be consistent across dosages)
            if not bounds_text:
                bounds_text = self._extract_bounds_text(dosage)

            # Extract dose information
            dose_info = self._extract_dose_quantity(dosage)
            if dose_info:
                dose_value, dose_unit = dose_info
                if not unit_text:
                    unit_text = dose_unit

                # For each day and each when code, set the dose
                for day_code in day_codes:
                    if day_code not in day_to_patterns:
                        day_to_patterns[day_code] = {code: 0 for code in self.WHEN_CODES_ORDER}

                    for when_code in when_codes:
                        if when_code in day_to_patterns[day_code]:
                            day_to_patterns[day_code][when_code] = dose_value

        if not day_to_patterns:
            return ""

        # Format each day with its 4-schema pattern
        sorted_days = sorted(day_to_patterns.keys(),
                             key=lambda day: self.DAY_ORDER.index(day) if day in self.DAY_ORDER else 99)

        day_text_parts = []
        for day_code in sorted_days:
            dose_pattern = day_to_patterns[day_code]
            day_name = self.DAY_TRANSLATIONS.get(day_code, day_code)

            # Format doses as "1-2-1-0" pattern
            dose_values = []
            for when_code in self.WHEN_CODES_ORDER:
                dose_value = dose_pattern[when_code]
                formatted_dose = self._format_decimal_value(dose_value)
                dose_values.append(formatted_dose)

            dose_pattern_text = "-".join(dose_values)
            
            # Add unit to each day if available
            if unit_text:
                day_text_parts.append(f"{day_name} {dose_pattern_text} {unit_text}")
            else:
                day_text_parts.append(f"{day_name} {dose_pattern_text}")

        # Combine all days with semicolons (each day is a complete dosage instruction with unit)
        combined_days = "; ".join(day_text_parts)

        # Add bounds if present
        if bounds_text:
            return f"{bounds_text}: {combined_days}"
        else:
            return combined_days

    def _generate_interval_and_time_schema_text(self, dosage_instructions):
        """
        Generate text for Interval + Time/4-Schema combination.
        
        This combines regular intervals (non-daily) with either timeOfDay or when codes.
        
        Args:
            dosage_instructions (list): List with interval and timing information
            
        Returns:
            str: Formatted text like "alle 2 Tage: 08:00 Uhr — je 1 Stück; 18:00 Uhr — je 2 Stück"
            
        Example FHIR input:
            - timing.repeat.frequency = 1, period = 2, periodUnit = "d"
            - timing.repeat.timeOfDay = ["08:00", "18:00"]
            - doseQuantity = {value: 1, unit: "Stück"}
            
        Example output: "alle 2 Tage: 08:00 Uhr — je 1 Stück; 18:00 Uhr — je 2 Stück"
        """
        if not dosage_instructions:
            return ""

        # Extract interval information from first dosage
        first_dosage = dosage_instructions[0]
        timing = first_dosage.get('timing', {})
        repeat_element = timing.get('repeat', {})

        # Extract bounds if present
        bounds_text = self._extract_bounds_text(first_dosage)

        # Generate interval text using original logic (ignores frequency!)
        period = repeat_element.get('period', 1)
        period_unit = repeat_element.get('periodUnit', 'd')

        # Original hardcoded interval text generation (replicates original behavior exactly)
        if period_unit == 'd':
            if period == 1:
                interval_text = "täglich"
            else:
                formatted_period = self._format_decimal_value(period)
                interval_text = f"alle {formatted_period} Tage"
        elif period_unit == 'wk':
            if period == 1:
                interval_text = "wöchentlich"
            else:
                formatted_period = self._format_decimal_value(period)
                interval_text = f"alle {formatted_period} Wochen"
        else:
            formatted_period = self._format_decimal_value(period)
            interval_text = f"alle {formatted_period} {period_unit}"

        # Group dosages by time or when code
        time_to_dosages = {}  # time_key -> list of dosages

        for dosage in dosage_instructions:
            timing = dosage.get('timing', {})
            repeat_element = timing.get('repeat', {})

            # Process timeOfDay entries
            if 'timeOfDay' in repeat_element and repeat_element['timeOfDay']:
                for time_of_day in repeat_element['timeOfDay']:
                    if time_of_day not in time_to_dosages:
                        time_to_dosages[time_of_day] = []
                    time_to_dosages[time_of_day].append(dosage)

            # Process when code entries  
            elif 'when' in repeat_element and repeat_element['when']:
                for when_code in repeat_element['when']:
                    if when_code in self.WHEN_CODE_TRANSLATIONS:
                        if when_code not in time_to_dosages:
                            time_to_dosages[when_code] = []
                        time_to_dosages[when_code].append(dosage)

        # Generate time-dose text parts
        time_dose_parts = []

        # Sort times: when codes first (in logical order), then timeOfDay chronologically
        def time_sort_key(time_key):
            if time_key in self.WHEN_CODES_ORDER:
                # When codes: use position in defined order
                return (0, self.WHEN_CODES_ORDER.index(time_key))
            else:
                # TimeOfDay: sort chronologically by time string
                return (1, time_key)

        sorted_times = sorted(time_to_dosages.keys(), key=time_sort_key)

        for time_key in sorted_times:
            dosages_at_time = time_to_dosages[time_key]

            # Format time display
            if time_key in self.WHEN_CODE_TRANSLATIONS:
                # This is a when code - use German translation
                time_display = self.WHEN_CODE_TRANSLATIONS[time_key]
            else:
                # This is a timeOfDay - format as German time
                time_display = self._format_time_german(time_key)

            # Calculate total dose at this time
            total_dose_value = 0
            unit_text = ""

            for dosage in dosages_at_time:
                dose_info = self._extract_dose_quantity(dosage)
                if dose_info:
                    dose_value, dose_unit = dose_info
                    total_dose_value += dose_value
                    if not unit_text:
                        unit_text = dose_unit

            # Format dose text
            formatted_dose = self._format_decimal_value(total_dose_value)
            dose_text = f"je {formatted_dose}"
            if unit_text:
                dose_text += f" {unit_text}"

            time_dose_parts.append(f"{time_display} — {dose_text}")

        # Combine all time-dose parts
        combined_times = "; ".join(time_dose_parts)

        # Build final text with bounds and interval
        if bounds_text:
            return f"{bounds_text} {interval_text}: {combined_times}"
        else:
            return f"{interval_text}: {combined_times}"

# ============================================================================
# MAIN FUNCTION - Command line interface
# ============================================================================

def main():
    """
    Command line interface for the dosage text generator.
    
    Usage: python medication-dosage-to-text.py <medication-resource.json>
    
    Reads a FHIR medication resource from JSON file and outputs German dosage text.
    """
    if len(sys.argv) < 2:
        print('Verwendung: python medication-dosage-to-text.py <medication-resource.json>', file=sys.stderr)
        print('', file=sys.stderr)
        print('Dieses Skript konvertiert FHIR-Medikationsdosierungen in deutschen Text.', file=sys.stderr)
        print('Unterstützte Ressourcentypen: MedicationRequest, MedicationDispense, MedicationStatement', file=sys.stderr)
        sys.exit(1)

    file_path = sys.argv[1]
    if not os.path.exists(file_path):
        print(f"Fehler: Datei '{file_path}' nicht gefunden.", file=sys.stderr)
        sys.exit(1)

    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            resource = json.load(file)

        generator = MedicationDosageTextGenerator()
        result = generator.generate_dosage_text(resource)
        print(result)

    except json.JSONDecodeError as e:
        print(f"Fehler: Ungültiges JSON in Datei '{file_path}'.", file=sys.stderr)
        print(f"JSON-Details: {e}", file=sys.stderr)
        sys.exit(1)
    except ValueError as e:
        print(f"Fehler: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Unerwarteter Fehler beim Verarbeiten der Datei: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
