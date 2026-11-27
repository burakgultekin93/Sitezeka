# SiteZeka

Yapay zekâ ile çalışan, avukat gözüyle tasarlanmış yeni nesil site/apartman yönetim sistemi (geçici ad).
Şu anki aşama: **demo** (sahte veri, gerçek ödeme/SMS yok).

Bu repo, kodu yazan 8 ajanlı Claude Code ekibinin ("ajans") kurulumunu içerir.

| Dosya | Ne işe yarar |
|---|---|
| `CLAUDE.md` | Ana oturumun (Müdür) her açılışta okuduğu kılavuz |
| `KURULUM.md` | Adım adım kurulum (Claude Code, GitHub, Drive, rclone) |
| `PROJE-TALIMATI.md` | claude.ai Projeler'e yapıştırılacak talimat metni |
| `.claude/agents/` | 8 ajan: mudur, arge, pazarlama, backend, frontend, hukuk, qa, arsiv |
| `.claude/skills/` | Ortak kurallar: tasarım sistemi, hesap motoru, KMK kuralları, demo verisi |
| `.claude/settings.json` | Ajanların onaysız çalıştırabileceği komutlar |
| `docs/` | Vizyon, demo planı, görevler, kararlar, onaylar, Burak'ın işleri |
| `scripts/drive-sync.sh` | Belgeleri Google Drive "Site Zeka" klasörüne senkronlar |

## Başlamak
```bash
git clone https://github.com/burakgultekin93/Sitezeka.git && cd Sitezeka
claude          # sonra: /model opus  ve KURULUM.md adım 7'deki ilk mesaj
```

Kurallar: para hesabı `decimal.js` ile, gerçek kişisel veri yok, her hukuki metin `TASLAK — AVUKAT ONAYI BEKLİYOR`.
