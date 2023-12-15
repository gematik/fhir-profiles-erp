FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Setzen der Umgebungsvariablen
ENV FIRELY_TERMINAL_VERSION=3.1.0
ENV JAVA_VALIDATOR_VERSION=6.0.11
ENV SUSHI_VERSION=3.5.0

# Installieren der notwendige Tools
# Add Microsoft's .NET SDK repository and install .NET SDK
RUN wget https://dot.net/v1/dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 6.0 --install-dir /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/local/bin \
    && rm dotnet-install.sh

# Install libraries
RUN apt-get update \
  && apt-get -y install openjdk-17-jre \
  && apt-get -y install nodejs \
  && apt-get -y install npm \
  && apt-get -y install findutils \
  && apt-get -y install curl \
  && apt-get -y install ca-certificates \
  && apt-get clean

# Install Firely Terminal as vscode user
# Switch to the vscode user
USER vscode

# Install Firely Terminal
RUN dotnet tool install --global Firely.Terminal --version $FIRELY_TERMINAL_VERSION

# Add .NET tools to PATH for vscode user
ENV PATH="/home/vscode/.dotnet/tools:${PATH}"

# Switch back to root user to perform remaining installations
USER root

RUN npm install -g fsh-sushi@$SUSHI_VERSION

# Setup for FHIR Validator
RUN mkdir -p /home/vscode/.fhir/validators/
RUN wget -q https://github.com/hapifhir/org.hl7.fhir.core/releases/download/$JAVA_VALIDATOR_VERSION/validator_cli.jar -O /home/vscode/.fhir/validators/validator_cli.jar

# Set ownership
RUN mkdir -p /home/vscode/.fhir/packages && \
    chown -R vscode:vscode /home/vscode/.fhir/packages

RUN mkdir -p /home/vscode/.fhir/settings/
COPY codfsh-config.yaml /home/vscode/.fhir/settings/codfsh-config.yaml

# Setzen des Arbeitsverzeichnis
WORKDIR /workspace

COPY . /workspace

CMD [ "/bin/bash" ]