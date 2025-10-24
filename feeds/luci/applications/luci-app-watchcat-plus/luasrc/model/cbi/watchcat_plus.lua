local m = Map("watchcat-plus", translate("Watchcat Plus"),
    translate("Advanced connectivity watchdog. Monitors connectivity via ping, HTTP and DNS; automatically restarts interfaces or device, or runs a custom script."))

local s = m:section(NamedSection, "config", "watchcat_plus", translate("General Settings"))

local en = s:option(Flag, "enabled", translate("Enable"))
en.default = en.enabled

local mode = s:option(ListValue, "mode", translate("Action Mode"))
mode:value("restart_interface", translate("Restart interface"))
mode:value("restart_device", translate("Reboot device"))
mode:value("run_script", translate("Run script"))
mode.default = "restart_interface"

local iface = s:option(Value, "iface", translate("Interface"))
iface.default = "pppoe-wan"

local targets = s:option(DynamicList, "targets", translate("Ping Targets"))
targets.datatype = "ipaddr"
targets.placeholder = "1.1.1.1"

local tping = s:option(Flag, "test_ping", translate("Enable ping tests"))
tping.default = tping.enabled

local http = s:option(Flag, "test_http", translate("Enable HTTP tests"))
http.default = http.disabled

local http_url = s:option(Value, "http_url", translate("HTTP URL"))
http_url.placeholder = "https://connectivitycheck.gstatic.com/generate_204"

local tdns = s:option(Flag, "test_dns", translate("Enable DNS tests"))
tdns.default = tdns.disabled

local dns_host = s:option(Value, "dns_host", translate("DNS Host"))
dns_host.placeholder = "openwrt.org"

local script = s:option(Value, "script", translate("Custom script path"))
script.placeholder = "/usr/sbin/custom_fix.sh"

local fail_max = s:option(Value, "fail_max", translate("Fail threshold"))
fail_max.datatype = "uinteger"
fail_max.default = 3

local ok_int = s:option(Value, "ok_interval", translate("Interval after success (s)"))
ok_int.datatype = "uinteger"
ok_int.default = 60

local fail_int = s:option(Value, "fail_interval", translate("Interval after failure (s)"))
fail_int.datatype = "uinteger"
fail_int.default = 15

local jit = s:option(Value, "jitter", translate("Jitter (s)"))
jit.datatype = "uinteger"
jit.default = 5

local bti = s:option(Flag, "bind_to_iface", translate("Bind tests to interface"))
bti.default = bti.enabled

local lt = s:option(Value, "log_tag", translate("Log tag"))
lt.placeholder = "watchcat-plus"

return m