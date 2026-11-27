#!/usr/bin/env bash
# SiteZeka → Google Drive senkronu (rclone ile)
# Kurulum: https://rclone.org/drive/  →  `rclone config` ile "gdrive" adında bir remote oluştur.
# Kullanım:  bash scripts/drive-sync.sh          (belgeler)
#            bash scripts/drive-sync.sh --yedek  (haftalık kod arşivi)
set -euo pipefail

REMOTE="gdrive:SiteZeka"
TARIH=$(date +%Y-%m-%d)

if ! command -v rclone >/dev/null 2>&1; then
  echo "HATA: rclone kurulu değil. KURULUM.md adım 4'e bak." ; exit 1
fi

EXCLUDES=(--exclude ".env*" --exclude "*.key" --exclude "*.pem" --exclude "node_modules/**" --exclude ".next/**")

if [[ "${1:-}" == "--yedek" ]]; then
  ARSIV="/tmp/sitezeka-kod-$TARIH.tar.gz"
  tar --exclude=node_modules --exclude=.next --exclude='.env*' --exclude=.git -czf "$ARSIV" .
  rclone copy "$ARSIV" "$REMOTE/06-Yedek/"
  echo "Yedek yüklendi: 06-Yedek/$(basename "$ARSIV")"
  exit 0
fi

rclone copy docs/ "$REMOTE/01-Plan/"           --include "{VIZYON,PLAN-DEMO,GOREVLER,KARARLAR}.md" "${EXCLUDES[@]}"
rclone copy docs/arge/    "$REMOTE/02-Arastirma/arge/"   "${EXCLUDES[@]}" 2>/dev/null || true
rclone copy docs/pazar/   "$REMOTE/02-Arastirma/pazar/"  "${EXCLUDES[@]}" 2>/dev/null || true
rclone copy docs/spec/    "$REMOTE/02-Arastirma/spec/"   "${EXCLUDES[@]}" 2>/dev/null || true
rclone copy docs/hukuk/   "$REMOTE/03-Hukuk/"            "${EXCLUDES[@]}" 2>/dev/null || true
rclone copy docs/qa/      "$REMOTE/04-Demo/qa/"          "${EXCLUDES[@]}" 2>/dev/null || true
rclone copy demo-ekran/   "$REMOTE/04-Demo/ekranlar/"    "${EXCLUDES[@]}" 2>/dev/null || true
rclone copy docs/ "$REMOTE/05-Onay/" --include "{ONAY,BURAK-YAPACAK}.md"
rclone copy docs/gunluk/  "$REMOTE/01-Plan/gunluk/"      "${EXCLUDES[@]}" 2>/dev/null || true

echo "Drive senkronu tamam: $TARIH"
