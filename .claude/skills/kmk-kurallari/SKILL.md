---
name: kmk-kurallari
description: Kat Mülkiyeti Kanunu'na dayalı hesap ve süreç kuralları (gecikme tazminatı, gider dağıtımı, kat malikleri kurulu toplantı/karar, işletme projesi). Aidat, gecikme, dağıtım, genel kurul veya karar defteri ile ilgili kod, spec ya da şablon yazmadan önce oku.
---

# KMK Kuralları (TASLAK — avukat onayı ve güncel mevzuat kontrolü gerekir)

## Kullanım
1. Kod/spec yazmadan önce `docs/hukuk/kurallar.md` dosyasındaki kural kartını bul. Yoksa hukuk ajanına yaptır.
2. Kural kartında "DOĞRULANMADI" varsa: kodu yaz ama ayarlanabilir parametre yap ve ONAY.md'ye madde aç.
3. Mevzuatı her zaman mevzuat.gov.tr güncel metninden doğrula; bu dosya yalnızca başlangıç rehberidir.

## Gider dağıtımı (KMK m.20 ve yönetim planı)
- Varsayılan: yönetim planında aksi yoksa giderlere arsa payı oranında katılım (kural kartında doğrula).
- Yazılım: dağıtım anahtarı site/kalem bazında seçilebilir: `ARSA_PAYI | ESIT | M2 | KISI | SAYAC | OZEL_ORAN`.
- Yönetim planının önceliği: site ayarına "yönetim planı hükmü" notu ve dağıtım anahtarı kaydedilir.

## Gecikme tazminatı (KMK m.20/2)
- Ödenmeyen borç için aylık %5 oranında gecikme tazminatı (güncel metinden doğrula).
- Açık sorular (ONAY gerektirir, parametre yap): basit/bileşik, gün bazlı kıst hesap mı tam ay mı,
  başlangıç günü (vade ertesi), kısmi ödemede mahsup sırası (önce ana para mı tazminat mı).
- Yazılım: `gecikmeHesapla({anapara, vade, odemeTarihi, oranAylik, yontem})` saf fonksiyon, Decimal.

## Kat malikleri kurulu (KMK m.29 ve ilgili maddeler)
- Toplantı ve karar yeter sayıları: sayı ve arsa payı çoğunluğu kuralları kural kartından alınır.
- Yazılım çıktıları: çağrı listesi (malik + arsa payı), hazirun cetveli (katılan/temsil), oy sayımı
  (kişi sayısı ve arsa payı ayrı ayrı), tutanak, karar defteri kaydı.
- Vekâletle temsil, bir bağımsız bölümün birden çok maliki (paylı mülkiyet) kenar durum olarak ele alınır.

## İşletme projesi (KMK m.37 vd. ve son değişiklikler)
- Tahmini gider bütçesi → daire başı pay → tebliğ → itiraz süresi. Son kanun değişikliklerini (ör. 7579 sayılı
  Kanun) Resmî Gazete metninden doğrula; süre ve usul kuralları parametre olsun.

## Denetim izi
Tahakkuk/tahsilat silinmez; düzeltme kaydı + gerekçe + kullanıcı + tarih.
