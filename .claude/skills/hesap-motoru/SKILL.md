---
name: hesap-motoru
description: Para hesabı kodlama standardı (decimal.js, kuruş, yuvarlama, mahsup, test şablonu). packages/hesap içinde veya tutar içeren herhangi bir kod yazmadan önce oku.
---

# Hesap Motoru Standardı

## Kurallar
- `import Decimal from "decimal.js"`; `Decimal.set({ precision: 20, rounding: Decimal.ROUND_HALF_UP })`.
- Veritabanında tutar = kuruş (`Int`). Motorda Decimal. UI'da `formatTL(kurus)` → `1.234,56 ₺`.
- Dağıtımda yuvarlama farkı: toplam korunur; artan kuruşlar en büyük kesirli paydan başlayarak dağıtılır
  (largest remainder). Test: dağıtılan toplam = fatura tutarı, kuruşu kuruşuna.
- Tarih: `date-fns` + `Europe/Istanbul`; vade günü dahil/haric kuralı parametre.
- Fonksiyonlar saf: girdi nesnesi → çıktı nesnesi + `aciklama[]` (hangi kural uygulandı, insan okunur).

## Mahsup
Site ayarı: `ESKI_BORC_ONCE | KALEM_SIRASI(Aidat>Yakıt>Demirbaş...) | TAZMINAT_ONCE | ANAPARA_ONCE`.
Çıktı: hangi ödeme hangi borcu ne kadar kapattı (satır satır).

## Test şablonu (Vitest)
```ts
describe("gecikme", () => {
  it("HS-01: 1.000,00 ₺ borç, 1 ay gecikme, aylık %5 → 50,00 ₺", () => {
    const r = gecikmeHesapla({ anaparaKurus: 100000, vade: "2026-01-31", odeme: "2026-02-28", oranAylik: "0.05", yontem: "BASIT_TAM_AY" });
    expect(r.tazminatKurus).toBe(5000);
  });
});
```
Her test adı hukuk ajanının senaryo ID'si (HS-xx) ile başlar.

## Zorunlu test tipleri
normal · sıfır · kuruş yuvarlama · kısmi ödeme · fazla ödeme (alacak bakiyesi) · ay sonu/şubat/artık yıl ·
mahsup sırası · iptal/düzeltme · çoklu kalem toplamı = birleşik bakiye.
