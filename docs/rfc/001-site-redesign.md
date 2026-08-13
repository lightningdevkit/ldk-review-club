---
layout: page
title: RFC 001 — Site Visual Redesign
permalink: /docs/rfc/001-site-redesign/
---

# RFC 001 — Site Visual Redesign

**Status:** Proposed  
**Branch:** `rfc/site-redesign`  
**Design source:** Claude Design handoff (`LDK Review Club.dc.html`)

## Summary

This RFC proposes replacing the current minimal Jekyll theme with a dark, retro-terminal visual identity for [ldk.reviews](https://ldk.reviews). The redesign keeps all existing content, URLs, and Jekyll post workflows unchanged — only presentation changes.

## Motivation

- Give the review club a distinctive visual identity aligned with LDK's lightning bolt branding
- Improve scanability of meeting listings and upcoming-session callouts
- Make first-time contributor resources more prominent on the home page

## Design

The prototype specifies:

| Element | Treatment |
|---------|-----------|
| Palette | `#0A0A0E` background, `#FFD60A` accent, `#ECECF1` text |
| Typography | Silkscreen (display) + Space Mono (body) via Google Fonts |
| Layout | Sticky yellow marquee ticker + left sidebar nav + main content column |
| Home | Animated hero bolt, 2×2 info grid, highlighted upcoming meeting card |
| Meetings | Month-grouped list with component tags and host metadata |
| Meeting detail | Tag pills, metadata grid, numbered question cards, Discord CTA |
| Static pages | Prose styling for Code of Conduct, Hosting, Your First Meeting |

## Implementation

- New stylesheet: `assets/css/redesign.sass` (replaces legacy theme in `all.sass`)
- New layout shell: `_layouts/default.html` with `_includes/redesign/*` components
- Updated `_layouts/pr.html` for meeting detail pages
- Updated `index.md`, `meetings*.html` with new markup
- Static pages switched to `layout: page` for prose styling

No changes to:

- Post front matter schema or `rake posts:new` workflow
- Permalinks or meeting log content
- `_config.yml` site metadata (except RFC preview flags)

## Preview

```shell
git checkout rfc/site-redesign
bundle install
make preview
# open http://localhost:4000
```

A preview banner appears on all pages while `redesign_rfc: true` is set in `_config.yml`.

## Open questions

1. **Domain branding** — sidebar shows "LDK REVIEW CLUB"; `<title>` still uses "LDK PR Review Club". Unify?
2. **Reduced motion** — marquee and hero animations respect `redesign_reduced_motion` config flag; should we also honour `prefers-reduced-motion` automatically?
3. **Meeting log pages** — IRC log styling from the old theme is removed. Do any past meetings still rely on log-specific CSS?
4. **Font loading** — Google Fonts CDN vs self-hosted for privacy/offline?

## Rollout

1. Review this RFC branch via PR preview deploy
2. Gather feedback in #review-club Discord
3. On acceptance: merge to `main`, remove `redesign_rfc` banner flag, deploy