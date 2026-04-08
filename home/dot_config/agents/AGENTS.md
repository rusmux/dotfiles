# Shared Agent Preferences

Prefer repo-local truth over generic guidance. Before deciding how to edit, validate, or run code, inspect the repository's existing code patterns, manifests, lint/format config, task runners, and local agent/project docs.

@~/.config/agents/python.md

## Working Style

- Do not add or write tests unless explicitly asked.

- Do not write docstrings unless the behavior is non-obvious and the explanation materially helps.

- Use Context7 to check any documentation when it is available.

- Assume GPU-dependent or heavy model-runtime flows are not available locally unless the user or repository clearly says otherwise.

- All GPU-related testing will be done on a remove server.

- Prefer the repository's existing conventions over introducing new abstractions or tooling.

- Do not overcomplicate or overengineer code to please linters. Ignore rule inline, per-file or globally if reasonable, or even allow a temporary lint failure.

- Never use semicolons at the end of list items in text.

## Preferred Tooling Defaults

Use these defaults unless the repository already has a clear alternative:

| Task                                 | Prefer    | Avoid                              |
| ------------------------------------ | --------- | ---------------------------------- |
| JS/TS package management             | `bun`     | `npm`, `yarn`, `pnpm`              |
| JS/TS script execution               | `bun run` | `node`, `ts-node`                  |
| Python environments and dependencies | `uv`      | `pip`, `pip3`, `pipenv`, `poetry`  |
| Runtime installation                 | `mise`    | `nvm`, `pyenv`, `rbenv`            |
| Task runner                          | `just`    | `make` when a `Justfile` exists    |
| Validation and linting               | `prek`    | ad hoc one-off lint command chains |

## Validation

- Must use `prek` for validation when the repository uses it.
- Prefer the smallest validation step that meaningfully checks the change.
