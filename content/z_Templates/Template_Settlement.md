---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
tags:
  - "#Settlement"
marker:
demographics: '<% tp.system.prompt("Demographics?") %>'
level: '<% tp.system.prompt("Settlement Level?") %>'
population: '<% tp.system.prompt("Population?") %>'
ruler: '<% tp.system.prompt("Ruler?") %>'
type: '<% tp.system.suggester(\["Capital City", "City", "Town", "Village", "Outpost", "Ruins"], \["Capital City", "City", "Town", "Village", "Outpost", "Ruins"]) %>'
---

> [!info]+ Details
> **Type:** `=this.type`
> **Level:** `=this.level`
> **Population:** `=this.population`
> **Demographics:** `=this.demographics`
> **Ruler:** `=this.ruler`

![[Assets/Locations/Coat of Arms/<% tp.file.title %> Emblem.webp|200]]
![[Assets/Locations/Maps/<% tp.file.title %> Map.webp|400]]

# Overview

# Geography & Layout

# Government & Law

# Districts

-

# Notable Locations

-

# Key NPCs

-

# Factions & Guilds

-

-

# History & Lore
