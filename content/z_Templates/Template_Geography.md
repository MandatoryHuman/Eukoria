---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
created: 2026-09-26T16:52:54.406Z
modified: 2026-09-26T17:18:52.592Z
published: 2026-09-26T17:18:52.592Z
tags:
  - Geography
climate: <% tp.system.prompt("Climate?") %>
danger_level: <% tp.system.suggester(\["Low", "Moderate", "Severe", "Extreme", "Varies"], \["Low", "Moderate", "Severe", "Extreme", "Varies"]) %>
known_for: <% tp.system.prompt("Known For?") %>
region: <% tp.system.prompt("Region?") %>
size_length: <% tp.system.prompt("Size/Length?") %>
type: <% tp.system.prompt("Geography Type? (e.g., Continent, Oceanic Channel)") %>
---

> [!info]+ Details
> **Type:** <% tp.system.prompt("Geography Type? (e.g., Continent, Oceanic Channel)") %>
> **Region:** <% tp.system.prompt("Region?") %>
> **Size/Length:** <% tp.system.prompt("Size/Length?") %>
> **Climate:** <% tp.system.prompt("Climate?") %>
> **Danger Level:** <% tp.system.suggester(\["Low", "Moderate", "Severe", "Extreme", "Varies"], \["Low", "Moderate", "Severe", "Extreme", "Varies"]) %>
> **Known For:** <% tp.system.prompt("Known For?") %>

![[Assets/Locations/Maps/<% tp.file.title %> Map.webp|400]]

# Overview

# Ecology & Environment

# Hazards & Encounters

# Landmarks & Points of Interest

# Natural Resources

# Myths & Lore
