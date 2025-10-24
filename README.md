📦 Kurulum
1. OpenWrt kaynak ağacına ekle

Bu dizinleri kopyalayın:

package/watchcat-plus/
feeds/luci/applications/luci-app-watchcat-plus/

2. Feed’leri güncelle ve menüye ekle
./scripts/feeds update -a
./scripts/feeds install -a

3. Menüden seç ve derle
make menuconfig
# Network → watchcat-plus
# LuCI → Applications → luci-app-watchcat-plus
make package/watchcat-plus/compile V=sc
make package/luci-app-watchcat-plus/compile V=sc

4. Router’a yükle
scp bin/packages/.../watchcat-plus_*.ipk root@router:/tmp/
scp bin/packages/.../luci-app-watchcat-plus_*.ipk root@router:/tmp/
ssh root@router "opkg install /tmp/watchcat-plus_*.ipk /tmp/luci-app-watchcat-plus_*.ipk"

⚙️ Varsayılan yapılandırma

/etc/config/watchcat-plus

config watchcat_plus 'config'
	option enabled '1'
	option mode 'restart_interface'
	option iface 'pppoe-wan'
	list targets '1.1.1.1'
	list targets '8.8.8.8'
	option test_http '1'
	option http_url 'https://connectivitycheck.gstatic.com/generate_204'
	option fail_max '3'
	option ok_interval '60'
	option fail_interval '15'
	option jitter '5'
	option bind_to_iface '1'

💻 LuCI Arayüzü

Ayarlar menüsü:
Services → Watchcat Plus

Görebileceğiniz alanlar:

Ping, HTTP, DNS test seçenekleri

Hedef listesi

Eylem modu

Süre, jitter ve arayüz seçimi

🧠 Log ve Durum Görüntüleme
logread -e watchcat-plus
/usr/sbin/watchcat-plus status
cat /var/run/watchcat-plus.state

📜 Lisans

GPLv3 – OpenWrt ekosistemiyle tam uyumlu.

🤝 Katkıda Bulunma

Pull request’ler ve iyileştirme önerileri memnuniyetle karşılanır.
Yeni test türleri (örneğin TLS el sıkışma veya DoH) eklemek için watchcat-plus script’ine katkıda bulunabilirsiniz.
