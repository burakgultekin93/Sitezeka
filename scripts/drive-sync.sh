#!/usr/bin/env bash
# SiteZeka → Google Drive senkronu (rclone ile)
# Kurulum: https://rclone.org/drive/  →  `rclone config` ile "gdrive" adında bir remote oluştur.
# Kullanım:  bash scripts/drive-sync.sh          (belgeler)
#            bash scripts/drive-sync.sh --yedek  (haftalık kod arşivi)
# Hedef klasör varsayılanı Drive'daki "Site Zeka" klasörüdür. Değiştirmek için:
#            SITEZEKA_DRIVE="gdrive:BaskaKlasor" bash scripts/drive-sync.sh
set -euo pipefail

# Betik hangi klasörden çağrılırsa çağrılsın repo kökünde çalış.
cd "$(dirname "$0")/.."

REMOTE="${SITEZEKA_DRIVE:-gdrive:Site Zeka}"
TARIH=$(date +%Y-%m-%d)

if ! command -v rclone >/dev/null 2>&1; then
  echo "HATA: rclone kurulu değil. KURULUM.md adım 4'e bak." ; exit 1
fi

# Gizli dosyalar hiçbir zaman Drive'a gitmez.
EXCLUDES=(--exclude ".env*" --exclude "*.key" --exclude "*.pem" --exclude "*.db" --exclude "node_modules/**" --exclude ".next/**" --exclude ".gitkeep")

if [[ "${1:-}" == "--yedek" ]]; then
  ARSIV="${TMPDIR:-/tmp}/sitezeka-kod-$TARIH.tar.gz"
  tar --exclude=node_modules --exclude=.next --exclude='.env*' --exclude='*.key' --exclude='*.pem' \
      --exclude='*.db' --exclude='*.db-journal' --exclude=.git -czf "$ARSIV" .
  rclone copy "$ARSIV" "$REMOTE/06-Yedek/"
  rm -f "$ARSIV"
  echo "Yedek yüklendi: 06-Yedek/sitezeka-kod-$TARIH.tar.gz"
  exit 0
fi

# Klasör varsa kopyala; yoksa atla. rclone hatası (ör. yetki) betiği durdurur, sessizce yutulmaz.
kopyala() {
  local kaynak="$1" hedef="$2"
  if [[ -d "$kaynak" ]]; then
    rclone copy "$kaynak" "$REMOTE/$hedef" "${EXCLUDES[@]}"
  else
    echo "Atlandı (klasör yok): $kaynak"
  fi
}

# Kök belgeler: yalnızca --include kullanılır (rclone'da --include ile --exclude karıştırılmamalı).
rclone copy docs/ "$REMOTE/01-Plan/" --include "/{VIZYON,PLAN-DEMO,GOREVLER,KARARLAR}.md"
rclone copy docs/ "$REMOTE/05-Onay/" --include "/{ONAY,BURAK-YAPACAK}.md"

kopyala docs/arge/      02-Arastirma/arge/
kopyala docs/pazar/     02-Arastirma/pazar/
kopyala docs/spec/      02-Arastirma/spec/
kopyala docs/arastirma/ 02-Arastirma/derin/
kopyala docs/hukuk/     03-Hukuk/
kopyala docs/qa/        04-Demo/qa/
kopyala demo-ekran/     04-Demo/ekranlar/
kopyala docs/gunluk/    01-Plan/gunluk/

echo "Drive senkronu tamam: $TARIH → $REMOTE"
