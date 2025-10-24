module("luci.controller.watchcat_plus", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/watchcat-plus") then return end
    entry({"admin","services","watchcat-plus"}, cbi("watchcat_plus"), _("Watchcat Plus"), 50).dependent = false
    entry({"admin","services","watchcat-plus","status"}, call("action_status")).leaf = true
end

function action_status()
    local http = require "luci.http"
    local fs = require "nixio.fs"
    http.prepare_content("application/json")
    http.write(fs.readfile("/var/run/watchcat-plus.state") or "{}")
end