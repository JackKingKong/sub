{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
ipv6: true
#【Meta专属】:true使用geoip.dat数据库,false(默认)使用mmdb数据库
geodata-mode: true
geodata-loader: standard
geo-auto-update: true
geo-update-interval: 24
#【Meta专属】:自定义geodata url
geox-url:
  #geoip: "https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
  #geosite: "https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"
  #mmdb: "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/Country.mmdb"
  geoip: "https://gh.aufa.eu.org/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
  geosite: "https://gh.aufa.eu.org/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
  mmdb: "https://gh.aufa.eu.org/https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/Country.mmdb"
#【Meta专属】:find-process-mode has 3 values:always, strict, off
#  - always, 开启，强制匹配所有进程
#  - strict, 默认，由 clash 判断是否开启
#  - off, 不匹配进程，推荐在路由器上使用此模式
find-process-mode: strict
#【Meta专属】:TCP连接并发，如果域名解析结果对应多个IP，并发所有IP，选择握手最快的IP进行连接
tcp-concurrent: true
#【Meta专属】:更换延迟计算方式，通过去除握手等额外开销来降低延迟数值
unified-delay: true
#【Meta专属】:更改 TCP Keep-alive 间隔，选择较大数值可以避免异常的资源消耗
keep-alive-interval: 3600
#【Meta专属】:监听IP白名单（当allow-lan：true），允许列表设备
bind-address: "*"
#【Meta专属】:缓存设置(文件位置./cache.db)
profile:
  #节点状态记忆（若不同配置有同代理名称,设置值共享）
  store-selected: true
  #fake-ip缓存
  #store-fake-ip: true
#【Meta专属】:域名嗅探
sniffer:
  #是否启用sniffer
  enable: true
  #是否对redir-host类型识别的流量进行强制嗅探
  force-dns-mapping: true
  #是否对所有未获取到域名的流量进行强制嗅探
  parse-pure-ip: true
  #是否使用嗅探结果作为实际访问，默认为 true
  override-destination: true
  sniff:
    HTTP:
      ports: [443]
      override-destination: true
    TLS:
      ports: [443]
      override-destination: true
    QUIC:
      ports: [443]
  #需要强制嗅探的域名（默认情况下只对IP进行嗅探）
  force-domain:
    #- +.v2ex.com
    #- "google.com"
    #- "+.netflix.com"
    #- "+.nflxvideo.net"
    #- "+.amazonaws.com"
    #- "+.media.dssott.com"
  #需要跳过嗅探的域名。主要解决部分站点sni字段非域名，导致嗅探结果异常的问题，如米家设备Mijia Cloud  
  skip-domain:
    #- "+.apple.com"
    - Mijia Cloud
    - dlg.io.mi.com
    #- "+.oray.com"
    #- "+.sunlogin.net"
    #- "+.push.apple.com"
cfw-bypass:
  - localhost
  - 127.*
  - 10.*
  - 192.168.*
  - <local>
hosts:
  055c165d-3142-401f-a43e-6a2681e72517.afdiancdn.org: 03bc4a78-642b-4efa-9f56-911bc5cf94e0.portail-offres.top
  0b7a0f52-da42-45b1-8a50-96dacfb23ac9.afdiancdn.org: 03bc4a78-642b-4efa-9f56-911bc5cf94e0.portail-offres.top
  2cf48aa5-ae3d-48b8-a500-e0b24c21c9a8.aixifan7498.com: 5c32a47c-ee3d-4061-8207-796ae470ec3c.sfr-bouygues.cloud
  2fc4443b-87c4-4b1d-ba6c-67ab211b0ded.aixifan7498.com: 5aa5e367-1606-48f0-9e7f-bde6fa16f1c2.sfr-bouygues.cloud
  49a9c695-018c-4bce-b4eb-2db75c8d6c7f.sankuaei.com: a6ead207-18e3-4cae-8ff6-47a9240c6229.definition-meaning.top
  6b7d1586-ddc9-4bc4-846b-9aeec018ea4c.afdiancdn.org: 1014f589-b81c-4ddd-b707-76c4a2ae6b9a.portail-offres.top
  708f31da-fdc7-4306-85be-de682416df58.aixifan7498.com: 003ba47d-9345-4cdb-8413-136adc0eae42.sfr-bouygues.cloud
  72198bfe-4edd-482e-8a20-402adf2ac287.afdiancdn.org: 990f10b7-779c-48e6-b364-c08bbfb4e1e0.portail-offres.top
  72c71fa6-355d-46b7-9289-4e5b73eb03f3.sankuaei.com: f4c43c19-06e9-487c-a8ef-8f946f66c13f.definition-meaning.top
  7b0bc2e9-ab7e-4279-9627-7d8cebdcdcc6.sankuaei.com: 7bce4df8-3483-4d10-8a6e-20ed747759fd.definition-meaning.top
  826ede8f-1152-4755-ae03-af0748469079.sankuaei.com: 2898fa8c-99c8-441b-88de-6bd6c7c59d52.definition-meaning.top
  8d6d8768-9970-40e0-a522-b22baf4ffdb5.afdiancdn.org: 37b03596-c3ad-41b0-9394-c7648919ca5e.portail-offres.top
  8e23e42d-1d25-4989-8cf3-1c818c32b006.sankuaei.com: 8cc02901-800b-47d2-bb37-cef805f73081.definition-meaning.top
  93aec4ca-866e-488b-9423-566cc5e81612.afdiancdn.org: 1014f589-b81c-4ddd-b707-76c4a2ae6b9a.portail-offres.top
  9689b1ce-43dc-4623-b35c-b41757bc39bd.sankuaei.com: e8b6cd12-66ba-43e2-bfb3-10c3584317a1.definition-meaning.top
  96f0162d-bcc8-4758-b020-99c0a9eeb8e9.afdiancdn.org: 03bc4a78-642b-4efa-9f56-911bc5cf94e0.portail-offres.top
  9c746c41-84bc-4410-9c10-7470d9fa4c47.aixifan7498.com: 64324025-76e7-4064-afa8-51d53a5d7c5b.sfr-bouygues.cloud
  a2dcf016-bf54-40e1-a856-a9d0d30a2d36.afdiancdn.org: 990f10b7-779c-48e6-b364-c08bbfb4e1e0.portail-offres.top
  a6d3a671-fa2f-4e49-bd0f-a839e1f9885d.sankuaei.com: ef4e6ed3-9d1e-4bda-b1da-a6941a8225c5.definition-meaning.top
  a8564fe6-d45a-4585-86e3-8e4e8f19131f.sankuaei.com: d9e06d8f-9416-4f45-846c-be792cdcc42a.definition-meaning.top
  ab7aa49a-6572-4b8f-a300-e3ea3f2e1944.sankuaei.com: 2168d33d-a6fd-4326-8642-42f80a6343e0.definition-meaning.top
  ab9cf853-935b-4a2c-b04b-9aa3d72e8219.sankuaei.com: c7222970-cd14-4802-86e3-162dd3746ae4.definition-meaning.top
  b19aeaf6-23d1-4f30-bddb-6720038b40b4.sankuaei.com: b298c915-48d8-4fbe-99da-4077529890e5.definition-meaning.top
  c7f0ef4e-cced-4ea8-9569-dcbcc306fb27.sankuaei.com: 5bf96e74-9ffb-4238-9885-14c61b8d22f9.definition-meaning.top
  cdcfe0bb-7615-43ea-8dce-1516aa8852fc.sankuaei.com: 1fa3835d-9e35-40c5-b2d4-b2c4c24a1529.definition-meaning.top
  d51b17ee-bbc5-4bcc-b95c-eb0881bba3a1.aixifan7498.com: b0af7ece-e93e-4ee1-80cc-dbd301ff84b8.sfr-bouygues.cloud
  e3f5a24a-29e7-4f46-a5f2-d44ec9e7d43a.afdiancdn.org: 37b03596-c3ad-41b0-9394-c7648919ca5e.portail-offres.top
  e46a98ed-7ebb-45a3-8b6a-49c35e60084c.aixifan7498.com: 4165c431-8650-4af0-a0d2-8b8e3c19345c.sfr-bouygues.cloud
  ec3bcbcc-f748-4556-b821-88badb739206.aixifan7498.com: 4bcd3033-6655-4d56-8763-4da6f376c1ee.sfr-bouygues.cloud
  ffef53ac-e4fe-4a47-ab4a-911247dd7ea0.aixifan7498.com: 6e85eef3-bcaf-444a-8283-8aac0d554cbc.sfr-bouygues.cloud
dns:
  enable: true
  ipv6: true
  listen: 0.0.0.0:7874
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  #核心开启规则感知分流,当访问一个网站，Mihomo会先看你的分流规则，如果规则说它是DIRECT（国内/直连）：Mihomo只会去找direct-nameserver（国内DNS）解析；
  #如果规则说它是PROXY（国外/代理）：Mihomo直接把域名发给远程代理节点，在海外无污染的环境下进行解析；未命中任何规则则使用nameserver解携。
  respect-rules: true
  use-hosts: true
  use-system-hosts: true
  #解析非IP的dns用的dns服务器,只支持纯IP
  default-nameserver:
    - tls://223.5.5.5:853
    - tls://1.12.12.12:853
  #解析代理服务器域名的dns
  proxy-server-nameserver:
    - udp://127.0.0.1:7874
    #- https://223.5.5.5/dns-query
    #- https://1.12.12.12/dns-query
  #指定域名使用自定义DNS解析
  nameserver-policy:
    "geosite:cn,private":
     - https://223.5.5.5/dns-query
     - https://1.12.12.12/dns-query
    '+.captive.apple.com,+.msftconnecttest.com,+.connect.rom.miui.com,+.connectivitycheck.gstatic.com,+.connectivitycheck.platform.hicloud.com':
      - https://223.5.5.5/dns-query
      - https://1.12.12.12/dns-query
    "+.github.com,+.githubusercontent.com":
      - https://akkodh.aufa.eu.org/my-doh
      - https://dh.aufa.eu.org/my-doh
      - https://odvr.nic.cz/doh
      - https://dns.digitale-gesellschaft.ch/dns-query
      - https://dnspub.restena.lu/dns-query
      - https://doh.applied-privacy.net/query
  #直连专属 DNS（当规则判定为 DIRECT 时，强制走这里)
  direct-nameserver:
    - https://223.5.5.5/dns-query
    - https://1.12.12.12/dns-query
  #默认兜底 DNS（未命中任何明确直连规则的流量走这里）
  nameserver:
    - https://akkodh.aufa.eu.org/my-doh
    - https://dh.aufa.eu.org/my-doh
    - https://odvr.nic.cz/doh
    - https://dns.digitale-gesellschaft.ch/dns-query
    - https://dnspub.restena.lu/dns-query
    - https://doh.applied-privacy.net/query
    #- https://223.5.5.5/dns-query
    #- https://1.12.12.12/dns-query
  #Fake-IP过滤器（这些域名必须返回真实IP，防止部分国内App报错）
  fake-ip-filter:
    #LAN 
    - "*.lan"
    - "*.localdomain"
    - "*.example"
    - "*.invalid"
    - "*.localhost"
    - "*.test"
    - "*.local"
    - "*.home.arpa"
    #放行NTP服务
    - time.*.com
    - time.*.gov
    - time.*.edu.cn
    - time.*.apple.com
    - time-ios.apple.com
    - time1.*.com
    - time2.*.com
    - time3.*.com
    - time4.*.com
    - time5.*.com
    - time6.*.com
    - time7.*.com
    - ntp.*.com
    - ntp1.*.com
    - ntp2.*.com
    - ntp3.*.com
    - ntp4.*.com
    - ntp5.*.com
    - ntp6.*.com
    - ntp7.*.com
    - "*.time.edu.cn"
    - "*.ntp.org.cn"
    - "+.pool.ntp.org"
    - time1.cloud.tencent.com
    #放行网易云音乐
    - music.163.com
    - "*.music.163.com"
    - "*.126.net"
    #百度音乐
    - musicapi.taihe.com
    - music.taihe.com
    #酷狗音乐
    - songsearch.kugou.com
    - trackercdn.kugou.com
    #酷我音乐
    - "*.kuwo.cn"
    #JOOX音乐
    - api-jooxtt.sanook.com
    - api.joox.com
    - joox.com
    #QQ音乐
    - y.qq.com
    - "*.y.qq.com"
    - streamoc.music.tc.qq.com
    - mobileoc.music.tc.qq.com
    - isure.stream.qqmusic.qq.com
    - dl.stream.qqmusic.qq.com
    - aqqmusic.tc.qq.com
    - amobile.music.tc.qq.com
    #虾米音乐
    - "*.xiami.com"
    #咪咕音乐
    - "*.music.migu.cn"
    - music.migu.cn
    #win10本地连接检测
    - "+.msftconnecttest.com"
    - "+.msftncsi.com"
    #QQ登录
    - localhost.ptlogin2.qq.com
    - localhost.sec.qq.com
    - "+.qq.com"
    - "+.tencent.com"
    #Game
    #Nintendo Switch
    - "+.srv.nintendo.net"
    - "*.n.n.srv.nintendo.net"
    - "+.cdn.nintendo.net"
    #Sony PlayStation
    - "+.stun.playstation.net"
    #Microsoft Xbox
    - xbox.*.*.microsoft.com
    - "*.*.xboxlive.com"
    - "*.ipv6.microsoft.com"
    - xbox.*.microsoft.com
    - xnotify.xboxlive.com
    #其他
    - teredo.*.*.*
    - teredo.*.*
    - speedtest.cros.wr.pvp.net
    - +.jjvip8.com
    - www.douyu.com
    - activityapi.huya.com
    - activityapi.huya.com.w.cdngslb.com
    #Wotgame
    - "+.battlenet.com.cn"
    - "+.wotgame.cn"
    - "+.wggames.cn"
    - "+.wowsgame.cn"
    - "+.wargaming.net"
    #Golang
    - proxy.golang.org
    #STUN
    - stun.*.*
    - stun.*.*.*
    - "+.stun.*.*"
    - "+.stun.*.*.*"
    - "+.stun.*.*.*.*"
    - "+.stun.*.*.*.*.*"
    #Linksys Router
    - heartbeat.belkin.com
    - "*.linksys.com"
    - "*.linksyssmartwifi.com"
    #ASUS Router
    - "*.router.asus.com"
    #Apple Software Update Service
    - mesu.apple.com
    - swscan.apple.com
    #- swquery.apple.com
    #- swdownload.apple.com
    #- swcdn.apple.com
    #- swdist.apple.com
    #Google
    - lens.l.google.com
    - stun.l.google.com
    - na.b.g-tun.com
    #Netflix
    - "+.nflxvideo.net"
    #FinalFantasy XIV Worldwide Server & CN Server
    - "*.square-enix.com"
    - "*.finalfantasyxiv.com"
    - "*.ffxiv.com"
    - "*.ff14.sdo.com"
    - ff.dorado.sdo.com
    #Bilibili
    - www.bilibili.com
    - api.bilibili.com
    - a.w.bilicdn1.com
    - "*.mcdn.bilivideo.cn"
    #Disney Plus
    - "+.media.dssott.com"
    #shark007 Codecs 
    - shark007.net
    #Mijia
    - Mijia Cloud
    #招商银行
    - "+.cmbchina.com"
    - "+.cmbimg.com"
   #AdGuard
    - local.adguard.org
    #迅雷
    - "+.sandai.net"
    - "+.n0808.com"
    #UU Plugin
    - "+.uu.163.com"
    - ps.res.netease.com
    #Wifi Calling
    - "+.pub.3gppnetwork.org"
    #GEOSITE(Meta core)
    - geosite:category-games
    #geosite:apple-cn
    #geosite:google-cn
    #Other
    #- mtalk.google.com
    #My DomainName
    #- "+.cloudapp.azure.com"
    - "+.subsite.cloudns.ch"
    - "+.subdomain.cloudns.ch"
    - "+.xigu.eu.org"
    - "+.aufa.eu.org"
    - "+.cjcj.eu.org"
    - "+.ismi.eu.org"
    - "+.gugg.dpdns.org"
    - "+.kcfc.dpdns.org"
    - "+.imgu.dpdns.org"
    - "+.oraclevcn.com"
    - "+.jhgxwl.cn"
    - "+.proxy302.com"
    - "+.iproyal.com"
    - "+.smartproxy.com"
    #TAG
    - "+.definition-meaning.top"
    - "+.sfr-bouygues.cloud"
    - "+.portail-offres.top"
    #MaYing
    - "+.cache872671.com"
    - "+.down657821.com"
    - "+.node897828.com"

{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
#server=119.29.29.29
#server=223.5.5.5
#server=1.0.0.1
#server=8.8.8.8
doh-server=https://120.53.53.53/dns-query,https://223.5.5.5/dns-query,https://1.1.1.1/dns-query,https://9.9.9.9/dns-query,https://208.67.222.222/dns-query,https://94.140.14.140/dns-query

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]

[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
