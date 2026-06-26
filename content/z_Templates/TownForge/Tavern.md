---
publish: true
created: 2026-06-26T13:51:47.848+01:00
modified: 2026-06-26T14:00:34.934+01:00
published: 2026-06-26T14:00:34.934+01:00
type: tavern
subtype: "{{subtype}}"
size: "{{size}}"
town: "{{town}}"
---

# {{name}}

> [!info] {{type}} in {{town}}

A {{type}} on the streets of {{town}}.

<%\*
const api = app.plugins.plugins\["randomness"].api;
const P = api.portraits;
const has = P && (await P.available());
const raceWord = (p) => ({ halfelf: "half-elf", halforc: "half-orc" }\[p.race] ?? p.race ?? "");
const descOf = (p) => p.age === "old" ? "silver-haired"
: (p.recipe.parts.scars ?? -1) >= 0 ? "scarred"
: (p.recipe.parts.facial\_hair ?? -1) >= 0 ? "bearded"
: p.age === "young" ? "fresh-faced" : "";
const infobox = (p, heading, lastRow) => \[
"> \[!infobox]", `> # ${p.name}`,
"> " + P.inlineSnippet(p.recipe, 160),
`> ###### ${heading}`, "> | |  |", "> | --- | --- |",
`> | Race | ${raceWord(p)} |`, `> | Gender | ${p.gender} |`,
`> | Age | ${p.age} |`, `> | ${lastRow} | {{name}} |`, "", "",
].join("\n");
const face = async (p, role) => {
const beat = (await api.rollUnscoped("Personality")).result;
return `- ${P.inlineSnippet(p.recipe, 96)} **${p.name}** — ${role}, ${beat}\n`;
};

// The keep — same person in the infobox and the rolled text.
let main = null;
if (has) { main = await P.roll(); tR += infobox(main, "Keep", "Pours at"); }

const result = await api.rollUnscoped("TF-Tavern", { promptValues: {
town: "{{town}}", shopType: "{{type}}", shopName: "{{name}}",
keeperName: main?.name ?? "", keeperRace: main ? raceWord(main) : "",
keeperGender: main?.gender ?? "", keeperAge: main?.age ?? "",
keeperDesc: main ? descOf(main) : ""
}});
tR += result.result;

// Propping up the bar.
if (has) {
tR += "\n\n## At the bar\n\n";
tR += await face(await P.roll(), "Regular");
}
%>
