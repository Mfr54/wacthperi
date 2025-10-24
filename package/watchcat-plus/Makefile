include $(TOPDIR)/rules.mk

PKG_NAME:=watchcat-plus
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/watchcat-plus
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Watchcat Plus – advanced connectivity watchdog
  DEPENDS:=+uci +libuci +libubox +ubus
endef

define Package/watchcat-plus/description
 An enhanced connectivity watchdog for OpenWrt. Monitors connectivity via ping, HTTP, and DNS tests, and automatically restarts network interfaces, reboots the device, or runs custom scripts when connectivity failures exceed a configurable threshold. Supports multiple ping targets, adaptive intervals, jitter, and logging.
endef

define Package/watchcat-plus/install
    $(INSTALL_DIR) $(1)/etc/init.d
    $(INSTALL_BIN) ./files/etc/init.d/watchcat-plus $(1)/etc/init.d/watchcat-plus
    $(INSTALL_DIR) $(1)/usr/sbin
    $(INSTALL_BIN) ./files/usr/sbin/watchcat-plus $(1)/usr/sbin/watchcat-plus
    $(INSTALL_DIR) $(1)/etc/config
    $(INSTALL_CONF) ./files/etc/config/watchcat-plus $(1)/etc/config/watchcat-plus
endef

$(eval $(call BuildPackage,watchcat-plus))