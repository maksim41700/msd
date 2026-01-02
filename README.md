# MSD — Repository overview

> Krótkie, praktyczne wprowadzenie — po polsku, konkretnie.

## Co to jest

Repo zawiera kod aplikacji MSD. Może zawierać komponenty backend (np. Apex/Force), frontend i skrypty pomocnicze. Ten README daje szybki start i wskazówki repo-specyficzne dla devów i AI-agentów.

# MSD — Repository overview

> Short, practical introduction — concise and actionable.

## What this repo is

This repository contains the MSD application code. It may include backend components (e.g. Salesforce Apex), frontend code, and helper scripts. This README provides a quick start and notes aimed at developers and AI assistants working on the project.

## Quick start

- Inspect project configuration under `.vscode/` and `.github/workflows/` for CI and editor settings.
- Node.js (if present):
    ```bash
    npm install
    npm test
    ```
- Python (if present):
    ```bash
    python -m venv .venv
    .venv\Scripts\activate
    pip install -r requirements.txt
    pytest
    ```
- Salesforce (if `sfdx-project.json` or `force-app` exist):
    ```bash
    sfdx auth:web:login -a DEV
    sfdx force:source:deploy -p force-app
    sfdx force:apex:test:run --resultformat human --codecoverage
    ```

## Architecture — how to quickly understand the codebase

- Look for `README.md`, `sfdx-project.json`, `package.json`, `pyproject.toml`, or `pom.xml` to identify the primary stack.
- Typical directory boundaries to inspect:
    - `force-app/main/default/classes/` — Apex classes (Salesforce logic), if present
    - `src/`, `app/`, `service/`, `api/` — main application modules
    - `worker/`, `jobs/` — asynchronous/background jobs

## Tests and conventions

- Tests are isolated: for Apex use `@isTest(SeeAllData=false)` and create test data inside the test.
- Mock external HTTP callouts (Apex → `HttpCalloutMock`; JS → `nock` or fetch-mock).
- Use `Test.startTest()/Test.stopTest()` when testing async behavior in Apex.
- Preserve the repository's existing naming and style conventions; follow local patterns rather than introducing broad style changes.

## Integrations and environment variables

- Check `config/`, `env`, or `.env.template` for endpoints and secrets.
- For deploy and migration commands, consult `.github/workflows/` to follow exact CI steps used by the project.

## Debugging and logs

- For Apex-related problems, consult Salesforce debug logs in the org and any `logs/` folder produced by local scripts.
- Run local tests before opening a PR to validate changes.

## How to prepare a PR

- Keep one logical change per PR.
- PR description must include: What changed, Why, and How to validate (manual or automated steps).
- Include or update tests that verify the change. If CI workflow changes are required, update `.github/workflows` and document the change in the PR.

## Guidance for AI agents and Copilot

- Start by scanning `package.json`, `sfdx-project.json`, and `.github/workflows` to identify the stack and standard commands.
- Do not introduce global or breaking changes without tests. Add tests that demonstrate the fix or feature.
- If you encounter callouts or secrets, request mocks or use existing test factories found in the repo.

## Contact and feedback

If anything is unclear or you want README entries tailored to the project's exact stack, tell me and I will scan the repository and refine this README with concrete file paths and commands.

---

_This file was generated automatically; please provide feedback and I will refine details based on the repository contents._

_Plik wygenerowany automatycznie — poproszę o feedback, dopracuję konkrety zgodnie z realnymi plikami w repo._

# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
