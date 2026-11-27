---
name: demo-veri
description: Sahte ama gerçekçi demo verisi üretme kuralları (Kalevar Demo Sitesi). Seed, mock veri, örnek Excel/ekstre veya örnek fatura hazırlarken oku.
---

# Demo Verisi Kuralları

## Kesin kural
Gerçek kişi, TCKN, telefon, e-posta, IBAN, adres YOK. İsimler açıkça sahte: "Ayşe Demo", "Mehmet Örnek".
Telefon 0555 000 00 xx, e-posta xx@ornek.test, IBAN TR00 0000 ... (geçersiz format kasıtlı).

## Kalevar Demo Sitesi
- 3 blok (A 40, B 40, C 40 = 120 bağımsız bölüm); 1+1 / 2+1 / 3+1 karışık; m² 65-160; arsa payı m²'ye orantılı (toplam 12000).
- Kişiler: %70 malik oturuyor, %30 kiracı; %5 paylı mülkiyet (2 malik); 3 daire satış/kiracı değişimi (tarihli).
- Kalemler: Aidat (aylık, arsa payı), Yakıt (kış ayları, m²), Demirbaş (yıllık 2 tahakkuk, eşit).
- 12 aylık hareket: %75 zamanında, %15 1-3 ay geç, %10 sürekli borçlu (3 tanesi 6 aydan fazla).
- Giderler: elektrik (ortak alan), su, doğalgaz, asansör bakımı (aylık), jeneratör (aylık), hidrofor (6 ayda bir),
  kazan (yaz ve kış bakımı), personel maaşı (2 görevli), temizlik, peyzaj, sigorta.
- Bu ay kasıtlı eksikler: jeneratör bakımı ve su faturası girilmemiş (eksik listesinde görünsün).
- Banka ekstresi Excel: 1 ay, 110 satır; açıklamalar karışık ("A12 KASIM AIDAT", "ayse demo aidat", "B-7", "EFT 3001...")
  → eşleştirme demosu için %80 kolay, %20 zor satır.
- 2 örnek fatura görseli (sahte firma "Demo Elektrik A.Ş.") + OCR beklenen sonucu JSON.
- 1 geçmiş genel kurul (tutanak + 4 karar) ve 1 yaklaşan toplantı taslağı.
- Duyurular: 5 örnek. Talepler: 8 örnek (asansör arızası, otopark, gürültü...).

## Dosyalar
`prisma/seed.ts`, `apps/web/lib/mock/*.ts`, `demo-dosyalar/banka-ekstresi-kasim.xlsx`, `demo-dosyalar/faturalar/*.png`,
`demo-dosyalar/yonetimcell-ornek.xlsx` (gerçek örnek gelene kadar tahmini format; "TAHMİNİ FORMAT" notu).
