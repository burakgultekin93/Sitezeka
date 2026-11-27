# SiteZeka Ajansı — Kurulum Rehberi (Pro plan)

## 0. İki ayrı "proje" var
| Nerede | Ne için | Ne koyacaksın |
|---|---|---|
| **claude.ai → Projeler** | Sohbetle strateji, derin araştırma, hukuk tartışması, karar | `PROJE-TALIMATI.md` → "Talimatlar"; `docs/VIZYON.md`, `docs/PLAN-DEMO.md`, `docs/KARARLAR.md` → "Bilgi" |
| **Claude Code (bilgisayarında)** | Ajanlarla kod yazma | Bu klasörün tamamı (CLAUDE.md, .claude/, docs/, scripts/) |

## 1. Claude Code
1. Node.js 20+ ve pnpm kur (`npm i -g pnpm`).
2. Claude Code'u kur ve Pro hesabınla giriş yap (resmi kurulum sayfasındaki komutla).
3. `/model opus` dene: çalışıyorsa Müdür Opus ile çalışır; çalışmıyorsa `mudur.md` içindeki `model: opus` satırını `model: sonnet` yap.

## 2. GitHub (kodun asıl yeri)
1. GitHub'da **özel** repo aç: `sitezeka`.
2. Bu klasörü bilgisayarına koy, içinde: `git init && git add . && git commit -m "Ajans kurulumu" && git remote add origin <repo-url> && git push -u origin main`

## 3. Google Drive (belgelerin yeri)
Drive'da `SiteZeka` klasörü ve alt klasörleri aç:
`01-Plan · 02-Arastirma · 03-Hukuk · 04-Demo · 05-Onay · 06-Yedek`

## 4. Drive senkronu (rclone)
1. rclone kur (rclone.org/install).
2. `rclone config` → yeni remote → ad: `gdrive` → tür: Google Drive → tarayıcıdan izin ver.
3. Test: `bash scripts/drive-sync.sh`
(Alternatif: Google Drive masaüstü uygulamasıyla yalnızca `docs/` klasörünü senkronla. Kod klasörünü Drive'a KOYMA.)

## 5. İzin ayarı dosyasını kendin oluştur
`.claude/settings.json` (ajanların onaysız çalıştırabileceği komutlar). İstersen kısıtla:
```json
{
  "model": "sonnet",
  "permissions": {
    "allow": ["Bash(pnpm *)", "Bash(npx prisma *)", "Bash(git status)", "Bash(git diff *)",
              "Bash(git add *)", "Bash(git commit *)", "Bash(bash scripts/drive-sync.sh*)"],
    "deny":  ["Read(./.env)", "Read(./.env.*)", "Bash(git push --force*)", "Bash(rm -rf *)"]
  }
}
```

## 6. Hazır skill'leri ekle (isteğe bağlı, kaliteyi artırır)
`.claude/skills/` içine klasör olarak ekle: frontend tasarım skill'leri (ör. frontend-design, ui-ux-pro-max),
araştırma skill'leri, docx/xlsx skill'leri. Her ajan kendi tanımında hangi skill'leri kullanacağını bilir;
yeni skill eklediğinde ilgili ajanın `.md` dosyasındaki "Skill kullanımı" bölümüne adını yaz.

## 7. İlk oturum (kopyala-yapıştır)
Klasörde `claude` çalıştır, `/model opus` yaz, sonra:

> Sen bu ajansın Müdürüsün. CLAUDE.md, docs/VIZYON.md ve docs/PLAN-DEMO.md'yi oku. Aşama 0'ı başlat:
> arge'ye 6 vay-be anının spec'ini, hukuk'a kural kartları ve test senaryolarını, pazarlama'ya rakip tablosu
> ve demo senaryosunu yaptır (aynı anda en fazla 2 ajan). Bitince bana ONAY listesini ve benim yapmam
> gerekenleri göster. Plan bitince Sonnet'e geçmemi hatırlat.

## 8. Günlük kullanım
- Sabah: `/model opus` → "Durumu oku, bugünün planını çıkar, onay bekleyenleri sor." → `/model sonnet`
- Gün içi: "Plandaki sıradaki görevleri ajanlara ver."
- Akşam: "Gün sonu denetimi yap, arsiv'e özet ve Drive senkronu yaptır, bana raporu ver."
- Limit dolarsa: "Kaldığımız yeri GOREVLER.md'ye yaz." → 5 saat sonra devam.
