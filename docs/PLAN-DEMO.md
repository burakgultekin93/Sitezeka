# Demo Planı (Pro plan: 5-7 iş günü)

Hedef: Kalevar yöneticisine 15 dakikada gösterilecek, sahte veriyle çalışan, "vay be" dedirten demo.

## Aşama 0 — Hazırlık (1 oturum)
| Görev | Ajan | Çıktı |
|---|---|---|
| Durum ve plan | mudur (opus) | Günlük plan, ONAY listesi |
| 6 "vay be" anının spec'i | arge | docs/spec/*.md |
| Kural kartları + test senaryoları | hukuk | docs/hukuk/kurallar.md, test-senaryolari.md |
| Demo senaryosu + rakip tablosu | pazarlama | docs/pazar/demo-senaryosu.md, rakipler.md |
| Onay | **Burak** | Spec + kural varsayımları onayı |

## Aşama 1 — Temel (1-2 gün)
| Görev | Ajan |
|---|---|
| Monorepo kurulumu (Next.js, Tailwind, shadcn, Prisma, Vitest, Playwright) | backend |
| Veri modeli + migration | backend |
| Hesap motoru: tahakkuk, bakiye (kalem bazlı), gecikme + testler | backend |
| Tasarım sistemi + yönetici paneli iskeleti + gösterge paneli | frontend |
| Demo verisi (Kalevar Demo Sitesi) | arsiv |
| Test turu | qa |

## Aşama 2 — Vay-be anları (2 gün)
| Görev | Ajan |
|---|---|
| Kalem bazlı bakiye ekranı (birleşik/ayrı, mahsup ayarı) | frontend + backend |
| Toplu fatura girişi + fotoğraftan OCR (Claude görüntü okuma; DEMO_MODE'da hazır sonuç) | backend + frontend |
| Banka ekstresi içe aktarma + eşleştirme önerisi | backend + frontend |
| Yükümlülük takvimi + aylık eksik listesi | backend + frontend |
| Genel kurul sihirbazı + .docx çıktılar | hukuk (şablon) + backend + frontend |
| Test turu | qa |

## Aşama 3 — AI Asistan ve cila (1-2 gün)
| Görev | Ajan |
|---|---|
| AI Asistan paneli (araç çağrılı: borç sorgu, rapor, yazı taslağı) | backend + frontend |
| Sakin portalı (mobil) | frontend |
| Gelir-gider / bilanço ekranı + Excel dışa aktarma | backend + frontend |
| Yönetimcell/Excel içe aktarma ekranı (örnek dosya ile) | backend + frontend |
| Demo akışı provası, sunum metni | pazarlama |
| Son test + ekran görüntüleri + Drive yükleme | qa + arsiv |
| Gün sonu demo raporu | mudur |

## Demo kontrol listesi (QA işaretler)
- [ ] Giriş → gösterge paneli 2 saniyede açılıyor
- [ ] Kalem bazlı ve birleşik bakiye toplamları eşit
- [ ] Gecikme tazminatı hukuk test senaryolarıyla birebir aynı
- [ ] Fatura fotoğrafı → dağıtım önizlemesi → onay çalışıyor
- [ ] Banka ekstresi: en az %80 satır doğru öneriyle eşleşiyor, kalanlar elle eşlenebiliyor
- [ ] Eksik listesi bu ay yapılmayan yükümlülükleri doğru gösteriyor
- [ ] Genel kurul .docx belgeleri malik/arsa payı ile otomatik doluyor ve TASLAK etiketli
- [ ] AI Asistan 5 örnek soruya doğru cevap veriyor (DEMO_MODE'da da)
- [ ] Sakin portalı 390px genişlikte sorunsuz
- [ ] Hiçbir yerde gerçek kişisel veri yok
- [ ] Türkçe karakter, tarih ve TL formatı doğru

## Burak'ın demo öncesi işleri
- Yöneticiden Yönetimcell dışa aktarım örneği (maskeli) ve 1 banka ekstresi örneği (maskeli)
- 3 hesap senaryosunu elle kontrol (gecikme tazminatı, yakıt ayrı bakiye, kısmi ödeme mahsubu)
- Demo randevusu
