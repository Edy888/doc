// =======================================================
// Siemens Healthineers – SAFE Typst Theme (Typst >= 0.14)
// Quarto-friendly: does NOT set paper size or margins.
// Uses `#show` rules for heading/link spacing + styling.
// =======================================================

// --------------------
// Brand colors (approx)
// --------------------
#let SH_BLUE = rgb("#009999")
#let SH_DARK = rgb("#003333")
#let SH_GRAY = rgb("#6f7c7d")
#let SH_LIGHT = rgb("#f4f8f8")
#let SH_ACCENT = rgb("#00b3b3")
#let SH_WARNING = rgb("#e67e22")
#let SH_DANGER = rgb("#c0392b")

// --------------------
// Base text + paragraphs
// --------------------
#set text(
  font: "Segoe UI",
  size: 11pt,
  fill: SH_DARK,
)

#set par(
  justify: true,
  // In Typst 0.14: line spacing is controlled via `par.leading`
  leading: 0.70em,
  // Space between paragraphs
  spacing: 1.00em,
)

// --------------------
// Headings (correct for Typst 0.14)
// --------------------
#show heading: set text(
  font: "Siemens Sans",
  weight: "semibold",
  fill: SH_BLUE,
)

// Sizes
#show heading.where(level: 1): set text(size: 22pt)
#show heading.where(level: 2): set text(size: 17pt)
#show heading.where(level: 3): set text(size: 14pt)
#show heading.where(level: 4): set text(size: 12pt)

// Spacing around headings (use block above/below)
#show heading.where(level: 1): set block(above: 1.5em, below: 0.8em)
#show heading.where(level: 2): set block(above: 1.2em, below: 0.6em)
#show heading.where(level: 3): set block(above: 1.0em, below: 0.4em)
#show heading.where(level: 4): set block(above: 0.8em, below: 0.3em)

// Links (SAFE)
#show link: set text(
  fill: SH_ACCENT
)


// --------------------
// Footer (Quarto controls margins/paper)
// --------------------
#set page(
  footer: align(
    right,
    text(size: 8pt, fill: SH_GRAY)[Siemens Healthineers · Confidential]
  )
)

// Horizontal separators — full width, Siemens style
#show line: set block(
  above: 1.2em,
  below: 1.2em,
)

#show line: set line(
  length: 100%,
  stroke: 0.6pt + SH_GRAY.lighten(35%)
)





// =======================================================
// Callout blocks (safe + reusable)
// Usage in Quarto:
// ```{=typst}
// #info("NOTE", [Text...])
// ```
// =======================================================
#let _sh_callout(kind, title, body) = block(
  fill: SH_LIGHT,
  stroke: (
    left: 4pt + (
      if kind == "info" { SH_BLUE }
      else if kind == "warning" { SH_WARNING }
      else if kind == "danger" { SH_DANGER }
      else { SH_GRAY }
    )
  ),
  inset: 10pt,
  radius: 6pt,
  [
    text(font: "Segoe UI", weight: "semibold", fill: SH_DARK)[title]
    linebreak()
    body
  ]
)

#let info(title, body) = _sh_callout("info", title, body)
#let warning(title, body) = _sh_callout("warning", title, body)
#let danger(title, body) = _sh_callout("danger", title, body)
#let note(title, body) = _sh_callout("note", title, body)

// Optional title block (manual use)
#let sh_titleblock(doc_title, subtitle: none, meta: none) = block(
  fill: SH_BLUE.lighten(90%),
  stroke: 0.8pt + SH_BLUE.lighten(40%),
  radius: 10pt,
  inset: 14pt,
  [
    text(size: 20pt, font: "Segoe UI", weight: "semibold", fill: SH_DARK)[doc_title]
    if subtitle != none {
      linebreak()
      text(size: 12pt, fill: SH_GRAY)[subtitle]
    }
    if meta != none {
      linebreak()
      linebreak()
      text(size: 9pt, fill: SH_GRAY)[meta]
    }
  ]
)
