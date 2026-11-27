---
name: tasarim-sistemi
description: SiteZeka arayüz tasarım sistemi (renk, tipografi, bileşenler, ekran kalıpları, AI kartı, Türkçe biçimler). Herhangi bir ekran veya bileşen yazmadan önce oku.
---

# SiteZeka Tasarım Sistemi

## His
Sakin, güvenilir, modern. "Banka uygulaması kadar güvenli, Notion kadar kolay." Kalabalık yok, bol boşluk.

## Renkler (Tailwind/CSS değişkeni)
- `--primary` derin petrol mavisi #0F4C5C · `--primary-foreground` #FFFFFF
- `--accent` (AI) mor-indigo #5B5BD6 — sadece AI önerileri ve asistan
- `--success` #1F9D55 (ödendi/alacak) · `--warning` #D97706 (borç/gecikme) · `--danger` #DC2626 (yalnızca kritik hata)
- Nötrler: zinc skalası; arka plan #FAFAFA, kart #FFFFFF, kenar #E4E4E7
- Karanlık mod destekli (shadcn tema değişkenleri).

## Tipografi
Inter (veya Geist). Başlık 24/20/16 semibold; gövde 14; tablo 13; tutarlar `tabular-nums`.

## Bileşen kalıpları
- **Görev kartı** (gösterge paneli): ikon + başlık + sayı + "İşle" düğmesi. Ör. "12 banka hareketi eşleşmeyi bekliyor".
- **Tutar hücresi:** sağa hizalı, `1.234,56 ₺`, borç turuncu, alacak yeşil, sıfır gri.
- **AI öneri kartı:** sol kenarda accent çizgi, ✨ ikon, öneri metni, "Neden?" açılır alanı, güven skoru rozeti,
  "Onayla" (primary) / "Düzelt" (outline) / "Yoksay" (ghost).
- **Sihirbaz:** üstte adım çubuğu (1 Kaynak → 2 Önizleme → 3 Onay), her adımda geri dönülebilir.
- **Tablo:** TanStack; filtre çubuğu, toplu seçim, sabit başlık, satır yüksekliği 44px, boş durum illüstrasyonu.
- **Durum rozetleri:** Ödendi · Kısmi · Gecikmiş · Bekliyor · Taslak (hukuki metin).

## Ekran düzeni
Sol kenar menü (daraltılabilir): Pano · Daireler · Borç & Tahsilat · Faturalar · Banka · Yükümlülükler ·
Gelir-Gider · Genel Kurul · Duyurular · Ayarlar. Üstte site seçici + arama + AI Asistan düğmesi (⌘K).
Sakin portalı: alt sekme çubuğu (Borcum · Öde · Duyurular · Talepler · Profil).

## Türkçe biçimler
Tarih `28.11.2026`, ay adı `Kasım 2026`, para `1.234,56 ₺`, yüzde `%5`, büyük harf dönüşümünde `tr-TR` locale (i/İ).

## Kalite kontrol
Her ekran: yükleniyor iskeleti, boş durum, hata durumu, 390px mobil, klavye odağı, AA kontrast.
