---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
tags:
  - Geography
climate: '<% tp.system.prompt("Climate?") %>'
danger_level: '<% tp.system.suggester(\["Low", "Moderate", "Severe", "Extreme", "Varies"], \["Low", "Moderate", "Severe", "Extreme", "Varies"]) %>'
known_for: '<% tp.system.prompt("Known For?") %>'
region: '<% tp.system.prompt("Region?") %>'
size_length: '<% tp.system.prompt("Size/Length?") %>'
type: '<% tp.system.prompt("Geography Type? (e.g., Continent, Oceanic Channel)") %>'
---

> [!info]+ Details
> **Type:** `=this.type`
> **Region:** `=this.region`
> **Size/Length:** `=this.size_length`
> **Climate:** `=this.climate`
> **Danger Level:** `=this.danger_level`
> **Known For:** `=this.known_for`

![[Assets/Locations/Maps/<% tp.file.title %> Map.webp|400]]

# Overview

# Ecology & Environment

# Hazards & Encounters

# Landmarks & Points of Interest

# Natural Resources

# Myths & Lore
