# =============================================
# Основные настройки
# =============================================
config.load_autoconfig(False)

# =============================================
# Tor Proxy
# =============================================
c.content.proxy = 'socks://127.0.0.1:9050'
c.content.proxy_dns_requests = False   # QtWebEngine не поддерживает

# =============================================
# AdBlock (очень важно для YouTube)
# =============================================
c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2025.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt",
]

c.content.blocking.enabled = True

# =============================================
# Внешний вид
# =============================================
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = 'never'

c.tabs.position = "top"
c.statusbar.position = "bottom"
c.tabs.favicons.show = "always"

c.fonts.default_family = ["JetBrains Mono", "DejaVu Sans Mono", "sans-serif"]
c.fonts.default_size = "14pt"

# =============================================
# Быстрые бинды для прокси
# =============================================
config.bind(',p', 'set content.proxy socks://127.0.0.1:9050')   # ,p = Tor ON
config.bind(',o', 'set content.proxy none')                     # ,o = Tor OFF
config.bind(',t', 'set content.proxy socks://127.0.0.1:9050;; message-info "Tor ON"')

# =============================================
# Дополнительно
# =============================================
c.content.javascript.enabled = True
c.content.autoplay = False
c.scrolling.smooth = True
c.downloads.position = "bottom"

print("=== Qutebrowser config loaded successfully ===")
