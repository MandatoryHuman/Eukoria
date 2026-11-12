---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
<<<<<<< HEAD
=======
created: 2026-11-12T17:37:18.919Z
modified: 2026-09-26T17:18:52.596Z
published: 2026-09-26T17:18:52.596Z
>>>>>>> 9154a718c11fbe82d5488ef60b627dad32fb5686
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
