#!/usr/bin/env python3
"""Prototype: convert a FHIR StructureMap JSON into a simple Graphviz DOT graph."""

import json
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Optional


def summarize_source(rule: Dict) -> str:
    parts: List[str] = []
    for src in rule.get("source", []) or []:
        ctx = src.get("context") or ""
        elem = src.get("element") or ""
        desc = ctx
        if elem:
            desc = f"{ctx}.{elem}" if ctx else elem
        cond = src.get("condition")
        if cond:
            desc = f"{desc} [{cond}]" if desc else f"[{cond}]"
        if desc:
            parts.append(desc)
    return "\\n".join(parts)


def summarize_target(rule: Dict) -> str:
    parts: List[str] = []
    for tgt in rule.get("target", []) or []:
        ctx = tgt.get("context") or ""
        elem = tgt.get("element") or ""
        desc = ctx
        if elem:
            desc = f"{ctx}.{elem}" if ctx else elem
        transform = tgt.get("transform")
        if transform:
            desc = f"{desc} ({transform})" if desc else f"({transform})"
        if desc:
            parts.append(desc)
    return "\\n".join(parts)


def sanitize_label(text: str) -> str:
    return text.replace('\\', '\\\\').replace('"', '\\"')


def ellipsize(text: str, max_length: int = 120) -> str:
    if len(text) <= max_length:
        return text
    return text[: max_length - 1] + "…"


def build_label(rule: Dict) -> str:
    lines: List[str] = []
    name = rule.get("name") or "(rule)"
    lines.append(name)

    doc = rule.get("documentation")
    if doc:
        lines.append(ellipsize(doc.strip()))

    src_summary = summarize_source(rule)
    if src_summary:
        lines.append(f"src: {src_summary}")

    tgt_summary = summarize_target(rule)
    if tgt_summary:
        lines.append(f"tgt: {tgt_summary}")

    label = "\\n".join(lines)
    return sanitize_label(label)


def traverse_rules(rules: List[Dict], nodes: List[Tuple[str, str]], edges: List[Tuple[str, str]], parent_id: Optional[str] = None, counter: List[int] = None):
    if counter is None:
        counter = [0]

    for rule in rules:
        counter[0] += 1
        node_id = f"node_{counter[0]}"
        nodes.append((node_id, build_label(rule)))
        if parent_id:
            edges.append((parent_id, node_id))
        child_rules = rule.get("rule") or []
        if child_rules:
            traverse_rules(child_rules, nodes, edges, node_id, counter)


def structuremap_to_dot(data: Dict) -> str:
    group = (data.get("group") or [None])[0]
    if not group:
        raise ValueError("StructureMap JSON contains no group")

    nodes: List[Tuple[str, str]] = []
    edges: List[Tuple[str, str]] = []

    root_label_parts = [group.get("name", "(group)")]
    if group.get("documentation"):
        root_label_parts.append(ellipsize(group["documentation"].strip()))
    root_label = sanitize_label("\\n".join(root_label_parts))
    nodes.append(("root", root_label))

    traverse_rules(group.get("rule", []), nodes, edges, parent_id="root")

    lines = [
        "digraph StructureMap {",
        "  rankdir=LR;",
        "  graph [splines=true, fontsize=10];",
        "  node [shape=box, style=\"rounded,filled\", fillcolor=\"#F4F6FB\", fontname=\"Arial\", fontsize=10];",
        "  edge [color=\"#6C737D\"];",
    ]

    for node_id, label in nodes:
        lines.append(f"  {node_id} [label=\"{label}\"];")

    for src, dst in edges:
        lines.append(f"  {src} -> {dst};")

    lines.append("}")
    return "\n".join(lines) + "\n"


def main():
    if len(sys.argv) not in (2, 3):
        print(f"Usage: {Path(sys.argv[0]).name} <StructureMap.json> [output.dot]", file=sys.stderr)
        sys.exit(1)

    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2]) if len(sys.argv) == 3 else None

    try:
        with input_path.open(encoding="utf-8") as handle:
            data = json.load(handle)
    except FileNotFoundError:
        print(f"Error: file not found: {input_path}", file=sys.stderr)
        sys.exit(1)
    except json.JSONDecodeError as exc:
        print(f"Error: invalid JSON in {input_path}: {exc}", file=sys.stderr)
        sys.exit(1)

    dot_content = structuremap_to_dot(data)

    if output_path:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(dot_content, encoding="utf-8")
    else:
        print(dot_content)


if __name__ == "__main__":
    main()
