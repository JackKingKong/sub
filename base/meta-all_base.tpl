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
  geoip: "https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
  geosite: "https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"
  mmdb: "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/Country.mmdb"
  #geoip: "https://gh.aufa.eu.org/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
  #geosite: "https//gh.aufa.eu.org/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
  #mmdb: "https://gh.aufa.eu.org/https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/Country.mmdb"
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
      ports: [80, 8080-8880]
      override-destination: true
    TLS:
      ports: [443, 8443]
    QUIC:
      ports: [443, 8443]
  #需要强制嗅探的域名（默认情况下只对IP进行嗅探）
  force-domain:
    #- +.v2ex.com
    #- "google.com"
    - "+.netflix.com"
    - "+.nflxvideo.net"
    - "+.amazonaws.com"
    - "+.media.dssott.com"
  #需要跳过嗅探的域名。主要解决部分站点sni字段非域名，导致嗅探结果异常的问题，如米家设备Mijia Cloud  
  skip-domain:
    - "+.apple.com"
    - Mijia Cloud
    - dlg.io.mi.com
    - "+.oray.com"
    - "+.sunlogin.net"
    - "+.push.apple.com"
hosts:
  #raw.githubusercontent.com: 151.101.76.133
  #aktv.top: 172.64.154.91
dns:
  enable: true
  ipv6: true
  listen: 0.0.0.0:7874
  enhanced-mode: redir-host
  prefer-h3: true
  use-hosts: true
  #解析非IP的dns用的dns服务器,只支持纯IP
  #default-nameserver:
  #  - 223.5.5.5
  #  - 119.29.29.29
  #【Meta专属】解析代理服务器域名的dns
  proxy-server-nameserver:
    - https://120.53.53.53/dns-query
    - https://223.5.5.5/dns-query
  #指定域名使用自定义DNS解析
  nameserver-policy:
    "geosite:cn,category-games@cn,category-netdisk-cn,private": https://223.5.5.5/dns-query
  nameserver:
    - https://1.1.1.1/dns-query
    - https://9.9.9.9/dns-query
    - https://208.67.222.222/dns-query
    - https://94.140.14.140/dns-query
    - https://hk.cjcj.eu.org/my-doh
    - https://dh.aufa.eu.org/my-doh

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
