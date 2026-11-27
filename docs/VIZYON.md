# SiteZeka — Ürün Vizyonu (geçici ad)

## Değer önerisi
"Site yönetiminin ay sonu işini 1 saate indiren, avukat gözüyle güvenli, yapay zekâ ile çalışan yönetim sistemi."

## Kimin için
1. **Profesyonel site yönetim şirketleri** (Kalevar gibi) — birden fazla site, personel, muhasebe yükü. İlk hedef.
2. **Orta/büyük siteler** (100-1.000 daire) — gönüllü/ücretli yönetici + muhasebeci.
3. **Apartmanlar** (5-50 daire) — sonraki aşama, sade paket.
Sakinler (malik/kiracı) son kullanıcıdır: şeffaflık ve kolay ödeme.

## Rakiplere göre konum
| | Apsiyon | Yönetimcell | SiteZeka |
|---|---|---|---|
| Kapsam | Çok geniş | Orta | Odaklı + derin |
| Kullanım | Kalabalık | Sade | Görev odaklı, sade |
| AI | Sınırlı/asistan | — | Çekirdekte: OCR, eşleştirme, asistan, belge üretimi |
| Hukuk | Gecikme tazminatı, takip | Genel kurul araçları | Avukat tasarımlı: kural motoru, ihtar/icra paketi, genel kurul otomasyonu |
| Veri taşıma | ? | — | Tek tık Yönetimcell/Excel içe aktarma |
| Fiyat | Kapalı | ~10.000 TL/yıl (gözlem) | Şeffaf, açık fiyat |

## Kalevar yöneticisinin acıları (gerçek geri bildirim)
1. Elektrik, su vb. faturaları tek tek girmek çok yorucu.
2. Bilançoyu Excel'de yapmak zorunda.
3. Banka hareketlerini elle giriyor, otomatik çekemiyor.
4. Genel kurul ve karar defterinde isimleri elle giriyor → otomatik olmalı.
5. Yönetimcell verileri tek seferde taşınmalı.
6. Yakıt oranları borç bakiyesinde ayrı çıkabilmeli (seçenekli).
7. Yönetimlere 1 aylık demo sunulmalı.
8. Periyodik işler hatırlatılmalı: elektrik, su, doğalgaz, asansör bakımı (aylık), jeneratör (aylık),
   personel maaşı (aylık), hidrofor (6 ayda bir), kazan (yaz/kış bakımı) → aylık "eksik listesi" raporu.

## Demo'nun 6 "vay be" anı
1. **AI Asistan:** "B blokta 3 aydan fazla borcu olanları listele ve hatırlatma yazısı hazırla."
2. **Fotoğraftan fatura:** fatura fotoğrafı → tutar, dönem, son ödeme tarihi okunur → dağıtım önizlemesi → onay.
3. **Banka ekstresi eşleştirme:** Excel yükle → AI her satırı daireyle eşleştirir (güven skoru + neden) → toplu onay.
4. **Kalem bazlı bakiye:** aidat/yakıt/demirbaş ayrı veya birleşik; mahsup sırası ayarı.
5. **Yükümlülük takvimi + eksik listesi:** hangi bakım/fatura/maaş bu ay yapılmadı, tek ekranda.
6. **Tek tıkla genel kurul:** malik listesi + arsa payları otomatik → çağrı, hazirun, tutanak, karar defteri (.docx).
Ek: Sakin portalı (mobil), bilanço/gelir-gider, Yönetimcell içe aktarma ekranı.

## İlkeler
- AI önerir, insan onaylar. Para ve hukukta AI asla sessiz işlem yapmaz.
- Her ekran bir iş; en çok 3 tık.
- Kayıt silinmez, düzeltilir (denetim izi).
- KVKK baştan: veri sorumlusu site yönetimi, SiteZeka veri işleyen; Türkiye'de barındırma hedefi.

## Sonraki aşamalar (demo dışı)
Pilot (10 site): gerçek veri taşıma, PostgreSQL, yedekleme, rol/yetki, SMS (İleti Merkezi/Netgsm), e-posta.
Sonra: sanal POS/ödeme kuruluşu (PayTR vb.), banka API, işletme projesi sihirbazı, ihtar/icra paketi,
sayaç/yakıt dağıtımı, rezervasyon, WhatsApp, çoklu site paneli, mobil uygulama (Capacitor).
