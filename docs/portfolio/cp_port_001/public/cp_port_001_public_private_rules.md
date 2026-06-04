# CP-PORT-001 Public and Private Content Rules

## Purpose

This document defines what can be published publicly and what must remain private.

## Public Content

The following content is safe for public portfolio use:

- Project name
- Public GitHub repository link
- Public release link
- Technology stack
- Project summary
- Feature list
- Architecture summary
- Validation results
- Mock-data limitation
- Screenshots without private information
- General role description

## Private Content

The following content must not be published:

- Personal phone number
- Personal email unless intentionally used for public contact
- Private CV details
- Private job application notes
- Personal financial information
- Client-specific information
- Any real medical data
- API keys
- Passwords
- Tokens
- Private business discussions
- Non-public strategy notes

## Rule

All public portfolio documents should be stored under:

docs/portfolio/cp_port_001/public/

All private notes should be stored outside Git tracking under:

.private/portfolio/cp_port_001/

## Decision

CP-PORT-001 will separate public presentation materials from private personal notes.

