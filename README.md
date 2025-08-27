# Introductie IaC – Voorbeeldrepo

Deze repository hoort bij de les *Introductie Infrastructure as Code*. Studenten kunnen deze repo **forken**, clonen en de opdrachten uitvoeren.

## Inhoud
- `install_apache_mysql.sh` – Imperatief shellscript (niet/half idempotent) om Apache en MySQL te installeren.
- `site.yml` – Declaratief Ansible playbook dat dezelfde desired state beschrijft.
- `templates/apache-site.conf.j2` – Apache vhost template.
- `inventory.ini` – Voorbeeldinventaris (localhost).
- `.gitignore` – Standaard ignore.
- `README.md` – Deze uitleg.

## Benodigdheden
- Ubuntu/Debian-omgeving (lokaal, VM of container).
- Git.
- (Voor Ansible) Ansible 2.14+

### Installatie Ansible (Ubuntu)
```bash
sudo apt-get update
sudo apt-get install -y ansible
```

## Opdracht 1 – Git basis
1. Fork deze repo.
2. Clone je fork.
3. Voeg je naam toe onder **Contributors** in deze README.
4. Commit & push.

## Opdracht 2 – Imperatief script (shell)
1. Lees `install_apache_mysql.sh` door.
2. Voer uit:
   ```bash
   chmod +x install_apache_mysql.sh
   sudo ./install_apache_mysql.sh
   ```
3. Controleer services:
   ```bash
   systemctl status apache2
   systemctl status mysql
   ```
4. Run het script **nogmaals** en observeer het gedrag (idempotency-problemen).

## Opdracht 3 – Declaratief (Ansible)
1. Bekijk `site.yml` en `templates/apache-site.conf.j2`.
2. Run:
   ```bash
   ansible-playbook -i inventory.ini site.yml
   ```
3. Run **nogmaals** (idempotent gedrag).
4. Bezoek: `http://localhost/` en controleer “Hello IaC World”.

## Opdracht 4 – Branch & PR
1. Maak branch: `feature/add-index-page`.
2. Pas `templates/index.html.j2` of variabelen aan (zie onder).
3. Commit, push en open een Pull Request naar je **eigen** `main`.
4. Vraag een medestudent om review, verwerk feedback en merge.

## Variabelen (optioneel)
Je kunt de documentroot/inhoud aanpassen via extra vars:
```bash
ansible-playbook -i inventory.ini site.yml -e "doc_root=/var/www/html/app page_title='Hello from Ansible'"
```

## Troubleshooting
- **MySQL root wachtwoord** wordt enkel gebruikt voor hardening in het imperatieve script; in het Ansible-playbook wordt niets met echte data gedaan.
- Draait er al iets op poort 80? Stop dan tijdelijke webservers of wijzig de poort in de template.

## Contributors
- (voeg jezelf hier toe)
