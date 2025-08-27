# CONTRIBUTING
Bedankt voor je interesse om bij te dragen! Dit project is onderwijs-materiaal voor een introductieles *Infrastructure as Code* (IaC).

## Werkwijze (fork & PR)
1. **Fork** de repository naar je eigen account.
2. **Clone** je fork en maak een feature branch: `git checkout -b feature/korte-omschrijving`.
3. Doe je wijziging(en) en voeg duidelijke commits toe (conventional-ish: `feat:`, `fix:`, `docs:`).
4. **Push** je branch en open een **Pull Request** naar `main` van je eigen fork (of—door docenten ingestelde—upstream repo).
5. Vraag een medestudent om een review en verwerk feedback.

## Code style & format
- Gebruik waar mogelijk duidelijke, declaratieve IaC-patterns.
- Houd README/Docs kort en taakgericht.
- Formatteer Markdown/JSON/YAML met Prettier (zie `.prettierrc`).

## Tests / checks
- Controleer dat `ansible-playbook -i inventory.ini site.yml` zonder fouten draait.
- Voor YAML/Ansible kun je optioneel `ansible-lint` draaien als je dat lokaal hebt.

## Commit messages
Gebruik beknopte, beschrijvende commits. Voorbeelden:
- `docs: verduidelijk instructies voor Opdracht 3`
- `feat: voeg custom doc_root var toe`
- `fix: corrigeer inventory hostnaam`

## Pull Requests
- Beschrijf het **doel** van de wijziging en hoe je dit getest hebt.
- Voeg indien van toepassing screenshots/logs toe.
- PRs die alleen whitespace of cosmetische wijzigingen doen, bundel waar mogelijk.

## Issue guidelines
- Gebruik de **bug** of **feature** template.
- Voeg context toe (OS/Ansible-versie, logregels, stappen om te reproduceren).

Dankjewel! ✨
