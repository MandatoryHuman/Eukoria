---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
created: 2026-09-26T16:52:54.401Z
modified: 2026-09-26T17:18:52.588Z
published: 2026-09-26T17:18:52.588Z
tags:
  - "#Gods"
alternate_domains: <% tp.system.prompt("Alternate Domains?") %>
anathema: <% tp.system.prompt("Anathema?") %>
areas_of_concern: <% tp.system.prompt("Areas of Concern?") %>
aspects: <% tp.system.prompt("Aspects? (e.g., Absence and Life)") %>
category: <% tp.system.suggester(\["Greater Gods", "Lesser Gods", "The Twins"], \["[[1. World Almanac/World/Gods & Divines/Greater Gods/index|Greater Gods]]", "[[1. World Almanac/World/Gods & Divines/Lesser Gods/index|Lesser Gods]]", "[[1. World Almanac/World/Gods & Divines/The Twins/index|The Twins]]"]) %>
cleric_spells: <% tp.system.prompt("Cleric Spells?") %>
divine_attribute: <% tp.system.prompt("Divine Attribute?") %>
divine_font: <% tp.system.suggester(\["Heal", "Harm", "Heal or Harm"], \["Heal", "Harm", "Heal or Harm"]) %>
divine_sanctification: <% tp.system.suggester(\["None", "Can choose Holy", "Can choose Unholy", "Must choose Holy", "Must choose Unholy"], \["None", "Can choose Holy", "Can choose Unholy", "Must choose Holy", "Must choose Unholy"]) %>
divine_skill: <% tp.system.prompt("Divine Skill?") %>
domains: <% tp.system.prompt("Domains?") %>
edicts: <% tp.system.prompt("Edicts?") %>
favoured_weapon: <% tp.system.prompt("Favoured Weapon?") %>
major_boon: ""
major_curse: ""
minor_boon: ""
minor_curse: ""
moderate_boon: ""
moderate_curse: ""
pantheons_covenants: <% tp.system.prompt("Pantheons/Covenants?") %>
religious_symbol: <% tp.system.prompt("Religious Symbol?") %>
sacred_animal: <% tp.system.prompt("Sacred Animal?") %>
sacred_colours: <% tp.system.prompt("Sacred Colours?") %>
---

> [!info]+ Details
> **Category:** <% tp.system.suggester(\["Greater Gods", "Lesser Gods", "The Twins"], \["[[1. World Almanac/World/Gods & Divines/Greater Gods/index|Greater Gods]]", "[[1. World Almanac/World/Gods & Divines/Lesser Gods/index|Lesser Gods]]", "[[1. World Almanac/World/Gods & Divines/The Twins/index|The Twins]]"]) %>
> **Aspects:** <% tp.system.prompt("Aspects? (e.g., Absence and Life)") %>
> **Edicts:** <% tp.system.prompt("Edicts?") %>
> **Anathema:** <% tp.system.prompt("Anathema?") %>
> **Areas of Concern:** <% tp.system.prompt("Areas of Concern?") %>
> **Religious Symbol:** <% tp.system.prompt("Religious Symbol?") %>
> **Sacred Animal:** <% tp.system.prompt("Sacred Animal?") %>
> **Sacred Colours:** <% tp.system.prompt("Sacred Colours?") %>
> **Pantheons/Covenants:** <% tp.system.prompt("Pantheons/Covenants?") %>

![[Assets/Gods/Symbols/<% tp.file.title %> Symbol.webp|400]]

## Devotee Benefits

> [!info]+ Details
> **Divine Attribute:** <% tp.system.prompt("Divine Attribute?") %>
> **Divine Font:** <% tp.system.suggester(\["Heal", "Harm", "Heal or Harm"], \["Heal", "Harm", "Heal or Harm"]) %>
> **Divine Sanctification:** <% tp.system.suggester(\["None", "Can choose Holy", "Can choose Unholy", "Must choose Holy", "Must choose Unholy"], \["None", "Can choose Holy", "Can choose Unholy", "Must choose Holy", "Must choose Unholy"]) %>
> **Divine Skill:** <% tp.system.prompt("Divine Skill?") %>
> **Favoured Weapon:** <% tp.system.prompt("Favoured Weapon?") %>
> **Domains:** <% tp.system.prompt("Domains?") %>
> **Alternate Domains:** <% tp.system.prompt("Alternate Domains?") %>
> **Cleric Spells:** <% tp.system.prompt("Cleric Spells?") %>

## [Divine Intercession](https://2e.aonprd.com/Rules.aspx?ID=804)

> [!info]+ Details
> **Minor Boon:**
> **Moderate Boon:**
> **Major Boon:**

> [!info]+ Details
> **Minor Curse:**
> **Moderate Curse:**
> **Major Curse:**
