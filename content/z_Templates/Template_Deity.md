---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
tags:
  - "#Gods"
alternate_domains: '<% tp.system.prompt("Alternate Domains?") %>'
anathema: '<% tp.system.prompt("Anathema?") %>'
areas_of_concern: '<% tp.system.prompt("Areas of Concern?") %>'
aspects: '<% tp.system.prompt("Aspects? (e.g., Absence and Life)") %>'
category: '<% tp.system.suggester(\["Greater Gods", "Lesser Gods", "The Twins"], \["[[1. World Almanac/World/Gods & Divines/Greater Gods/index|Greater Gods]]", "[[1. World Almanac/World/Gods & Divines/Lesser Gods/index|Lesser Gods]]", "[[1. World Almanac/World/Gods & Divines/The Twins/index|The Twins]]"]) %>'
cleric_spells: '<% tp.system.prompt("Cleric Spells?") %>'
divine_attribute: '<% tp.system.prompt("Divine Attribute?") %>'
divine_font: '<% tp.system.suggester(\["Heal", "Harm", "Heal or Harm"], \["Heal", "Harm", "Heal or Harm"]) %>'
divine_sanctification: '<% tp.system.suggester(\["None", "Can choose Holy", "Can choose Unholy", "Must choose Holy", "Must choose Unholy"], \["None", "Can choose Holy", "Can choose Unholy", "Must choose Holy", "Must choose Unholy"]) %>'
divine_skill: '<% tp.system.prompt("Divine Skill?") %>'
domains: '<% tp.system.prompt("Domains?") %>'
edicts: '<% tp.system.prompt("Edicts?") %>'
favoured_weapon: '<% tp.system.prompt("Favoured Weapon?") %>'
major_boon: ''
major_curse: ''
minor_boon: ''
minor_curse: ''
moderate_boon: ''
moderate_curse: ''
pantheons_covenants: '<% tp.system.prompt("Pantheons/Covenants?") %>'
religious_symbol: '<% tp.system.prompt("Religious Symbol?") %>'
sacred_animal: '<% tp.system.prompt("Sacred Animal?") %>'
sacred_colours: '<% tp.system.prompt("Sacred Colours?") %>'
---

> [!info]+ Details
> **Category:** `=this.category`
> **Aspects:** `=this.aspects`
> **Edicts:** `=this.edicts`
> **Anathema:** `=this.anathema`
> **Areas of Concern:** `=this.areas_of_concern`
> **Religious Symbol:** `=this.religious_symbol`
> **Sacred Animal:** `=this.sacred_animal`
> **Sacred Colours:** `=this.sacred_colours`
> **Pantheons/Covenants:** `=this.pantheons_covenants`

![[Assets/Gods/Symbols/<% tp.file.title %> Symbol.webp|400]]

## Devotee Benefits

> [!info]+ Details
> **Divine Attribute:** `=this.divine_attribute`
> **Divine Font:** `=this.divine_font`
> **Divine Sanctification:** `=this.divine_sanctification`
> **Divine Skill:** `=this.divine_skill`
> **Favoured Weapon:** `=this.favoured_weapon`
> **Domains:** `=this.domains`
> **Alternate Domains:** `=this.alternate_domains`
> **Cleric Spells:** `=this.cleric_spells`

## [Divine Intercession](https://2e.aonprd.com/Rules.aspx?ID=804)

> [!info]+ Details
> **Minor Boon:** `=this.minor_boon`
> **Moderate Boon:** `=this.moderate_boon`
> **Major Boon:** `=this.major_boon`

> [!info]+ Details
> **Minor Curse:** `=this.minor_curse`
> **Moderate Curse:** `=this.moderate_curse`
> **Major Curse:** `=this.major_curse`
