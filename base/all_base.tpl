{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
hosts:
  #mtalk.google.com: 108.177.125.188
  #raw.githubusercontent.com: 151.101.76.133
  aktv.top: 172.64.154.91
dns:
  enabled: true
  ipv6: true
  listen: 0.0.0.0:7874
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  #prefer-h3: true
  use-hosts: true
  nameserver-policy:
    "+.pphimalayanrt.com": 223.5.5.5
    st.dl.eccdnx.com: 223.5.5.5
    "+.tmall.com": 223.5.5.5
    "+.taobao.com": 223.5.5.5
    "+.alicdn.com": 223.5.5.5
    "+.aliyun.com": 223.5.5.5
    "+.alipay*.com": 223.5.5.5
    "+.alibaba*.com": 223.5.5.5
    "+.alimama*.com": 223.5.5.5
    "+.baidu.com": 223.5.5.5
    "+.bdstatic.com": 223.5.5.5
    "+.qq.com": 119.29.29.29
    "+.tencent.com": 119.29.29.29
    "+.weixin.com": 119.29.29.29
    "+.qpic.cn": 119.29.29.29
    "+.jd.com": 119.29.29.29
    "+.bilibili.com": 119.29.29.29
    "+.hdslb.com": 119.29.29.29
    "+.163.com": 119.29.29.29
    "+.126.com": 119.29.29.29
    "+.126.net": 119.29.29.29
    "+.127.net": 119.29.29.29
    "+.netease.com": 119.29.29.29
    "+.bilivideo.+": 119.29.29.29
    "+.iqiyi.com": 119.29.29.29 
    "+.douyinvod.com": 180.184.1.1
    "+.douyin.com": 180.184.1.1
    "+.douyincdn.com": 180.184.1.1
    "+.douyinpic.com": 180.184.1.1
    "+.feishu.cn": 180.184.1.1
  nameserver:
    #- 114.114.114.114
    #- 119.29.29.29
    - https://120.53.53.53/dns-query
    - https://223.5.5.5/dns-query
  fallback:
    - https://1.1.1.1/dns-query
    #- tls://1.0.0.1:853
    - https://9.9.9.9/dns-query
    #- tls://149.112.112.112:853
    - https://208.67.222.222/dns-query
    #- tls://208.67.220.220:853
    - https://94.140.14.140/dns-query
    #- tls://94.140.14.141:853
    #- https://101.101.101.101/dns-query
    #- tls://101.101.101.101:853
    #- tls://77.88.8.8:853
    #- tls://77.88.8.1:853
    - https://hk.cjcj.eu.org/my-dns-query
    - https://sub.cjcj.eu.org/my-dns-query
  fallback-filter:
    geoip: true
    geoip-code: CN
    ipcidr:
      - 240.0.0.0/4
      - 0.0.0.0/32
      - 127.0.0.1/32
    domain:
      - "*.tw"
      - testflight.apple.com
      - "+.facebook.com"
      - "+.twitter.com"
      - "+.google.com"
      - "+.googleapis.com"
      - "+.google.cn"
      - "+.googleapis.cn"
      - "+.xn--ngstr-lra8j.com"
      - "+.googlevideo.com"
      - "+.gvt1.com"
      - "+.gmail.com"
      - "+.youtube.com"
      - "+.youtu.be"
      - "+.gvt0.com"
      - "+.gvt2.com"
      - "+.gvt3.com"
      - "+.gstatic.com"
      - "+.265.com"
      - "+.2mdn.net"
      - "+.app-measurement.com"
      - "+.c.admob.com"
      - "+.clickserve.dartsearch.net"
      - "+.crl.pki.goog"
      - "+.doubleclick.net"
      - "+.firebase-settings.crashlytics.com"
      - "+.google-analytics.com"
      - "+.googleadservices.com"
      - "+.googleanalytics.com"
      - "+.googleoptimize.com"
      - "+.googlesyndication.com"
      - "+.googletagmanager.com"
      - "+.googletagservices.com"
      - time.android.com
      - "+.mnc260.mcc310.pub.3gppnetwork.org"
      - "+.mnc015.mcc234.pub.3gppnetwork.org"
      - "+.proxy302.com"
      - "+.iproyal.com"
      - "+.smartproxy.com"
  enable: true
  #default-nameserver:
    #- 223.5.5.5
    #- 208.67.222.222
  fake-ip-filter:
    #LAN 
    - "*.lan"
    - "*.localdomain"
    - "*.example"
    - "*.invalid"
    - "*.localhost"
    - "*.test"
    - "*.local"
    #放行NTP服务
    - "*.home.arpa"
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
    #Sony PlayStation
    - "+.stun.playstation.net"
    #Microsoft Xbox
    - xbox.*.*.microsoft.com
    - "*.*.xboxlive.com"
    - xbox.*.microsoft.com
    - xnotify.xboxlive.com
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
    - swquery.apple.com
    - swdownload.apple.com
    - swcdn.apple.com
    - swdist.apple.com
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
    #Nexitally
    - teredo.*.*.*
    - teredo.*.*
    - speedtest.cros.wr.pvp.net
    - "+.jjvip8.com"
    - www.douyu.com
    - activityapi.huya.com
    - activityapi.huya.com.w.cdngslb.com
    #Other
    - mtalk.google.com
    #UltraMobile&Giffgaff
    #- "+.mnc260.mcc310.pub.3gppnetwork.org"
    - "+.pub.3gppnetwork.org"
    #My DomainName
    - "+.cloudapp.azure.com"
    - "+.subsite.cloudns.ch"
    - "+.subdomain.cloudns.ch"
    - "+.xigu.eu.org"
    - "+.aufa.eu.org"
    - "+.gugg.us.kg"
    - "+.kcfc.us.kg"
    - "+.oraclevcn.com"
    - "+.jhgxwl.cn"
    - "+.proxy302.com"
    - "+.iproyal.com"
    - "+.smartproxy.com"

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
#static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
#static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
#static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
#static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
#static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
#static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
#static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
#static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
#static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
#static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

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
