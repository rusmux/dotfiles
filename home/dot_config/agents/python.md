# Python Preferences

Apply these defaults when working in Python code unless the repository or user says otherwise.

- For Python commands, must use the project's existing virtual environment when one exists.
- Never use dataclasses. Use Pydantic models instead.
- Always compile Python files for validation.
- Never overcomplicate typing unnecessarily. Don't use `cast`.
- Never use __future__ imports.
- Never use argparse. Use Typer or jsonargparse instead, depending what fits the project better.
