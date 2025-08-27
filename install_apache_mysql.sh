#!/bin/bash
# Imperatief script – laat opzet en beperkte idempotency zien
# Doel: Apache + MySQL installeren en basisconfiguratie toepassen op Debian/Ubuntu

set -e

LOGFILE="/var/log/install_web_database.log"
APACHE_CONF="/etc/apache2/sites-available/000-default.conf"
DB_ROOT_PASSWORD="SecurePassword123!"

log() { echo "[$(date '+%F %T')] $1" | tee -a "$LOGFILE" ; }

if [[ $EUID -ne 0 ]]; then
  echo "Run als root (sudo)"; exit 1
fi

log "Apt cache bijwerken…"
apt-get update >>"$LOGFILE" 2>&1

log "Apache en MySQL installeren (indien nodig)…"
DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 mysql-server >>"$LOGFILE" 2>&1 || true

log "Apache vhost aanpassen (niet-bestand-check: beperkte idempotency)…"
if [[ -f "$APACHE_CONF" ]]; then
  cp "$APACHE_CONF" "$APACHE_CONF.backup.$(date +%s)" || true
  sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/app|' "$APACHE_CONF" || true
fi

log "Apache enable/start…"
systemctl enable apache2 >>"$LOGFILE" 2>&1 || true
systemctl start apache2 >>"$LOGFILE" 2>&1 || true

log "MySQL enable/start…"
systemctl enable mysql >>"$LOGFILE" 2>&1 || true
systemctl start mysql >>"$LOGFILE" 2>&1 || true

log "MySQL basis hardening (kan mislukken bij herhaalde runs)…"
mysql -u root -e "DELETE FROM mysql.user WHERE User='';" >>"$LOGFILE" 2>&1 || true
mysql -u root -e "DROP DATABASE IF EXISTS test;" >>"$LOGFILE" 2>&1 || true
mysql -u root -e "FLUSH PRIVILEGES;" >>"$LOGFILE" 2>&1 || true

log "Index pagina plaatsen (kan overschrijven)…"
mkdir -p /var/www/html/app
echo "<h1>Hello IaC World (shell)</h1>" > /var/www/html/app/index.html

log "Apache herstarten…"
systemctl restart apache2 >>"$LOGFILE" 2>&1 || true

log "Klaar. Mogelijk niet idempotent; run nogmaals en observeer verschillen."
