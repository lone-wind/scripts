#Build by lone-wind
opkg list_installed
uninstall_overview_wireguard () {
    opkg remove wireguard
    opkg remove luci-i18n-wireguard-zh-cn
    opkg remove luci-i18n-wireguard-pt-br
    opkg remove luci-i18n-wireguard-ja
    opkg remove luci-i18n-wireguard-ru
    opkg remove luci-i18n-wireguard-sv
    opkg remove luci-app-wireguard
    opkg remove luci-proto-wireguard
    opkg remove wireguard-tools
	opkg remove kmod-wireguard
}
uninstall_overview_mwan () {
    opkg remove luci-app-syncdial
    opkg remove luci-i18n-mwan3helper-zh-cn
    opkg remove luci-i18n-mwan3-ru
    opkg remove luci-i18n-mwan3-zh-tw
    opkg remove luci-i18n-mwan3-ja
    opkg remove luci-i18n-mwan3-zh-cn
    opkg remove luci-app-mwan3helper
	opkg remove luci-app-mwan3
	opkg remove mwan3
}
uninstall_system_autoreboot () {
    opkg remove luci-i18n-autoreboot-zh-cn
	opkg remove luci-app-autoreboot
}
uninstall_service_godproxy () {
	opkg remove luci-app-godproxy
}
uninstall_service_adguardhome () {
	opkg remove luci-app-adguardhome
}
uninstall_service_serverchan () {
	opkg remove luci-app-serverchan
}
uninstall_service_accesscontrol () {
	opkg remove luci-i18n-accesscontrol-zh-cn
	opkg remove luci-app-accesscontrol
}
uninstall_service_unblockmusic () {
	opkg remove luci-i18n-unblockmusic-zh-cn
	opkg remove luci-app-unblockmusic
	opkg remove UnblockNeteaseMusic
	opkg remove UnblockNeteaseMusic-Go
}
uninstall_service_smartdns () {
	opkg remove luci-i18n-smartdns-zh-cn
	opkg remove luci-app-smartdns
	opkg remove smartdns
}
uninstall_service_wol () {
	opkg remove luci-i18n-wol-pl
	opkg remove luci-i18n-wol-pt
	opkg remove luci-i18n-wol-ro
	opkg remove luci-i18n-wol-ru
	opkg remove luci-i18n-wol-sk
	opkg remove luci-i18n-wol-tr
	opkg remove luci-i18n-wol-uk
	opkg remove luci-i18n-wol-vi
	opkg remove luci-i18n-wol-zh-tw
	opkg remove luci-i18n-wol-pt-br
	opkg remove luci-i18n-wol-ca
	opkg remove luci-i18n-wol-cs
	opkg remove luci-i18n-wol-de
	opkg remove luci-i18n-wol-el
	opkg remove luci-i18n-wol-es
	opkg remove luci-i18n-wol-fr
	opkg remove luci-i18n-wol-he
	opkg remove luci-i18n-wol-hu
	opkg remove luci-i18n-wol-it
	opkg remove luci-i18n-wol-ja
	opkg remove luci-i18n-wol-ms
	opkg remove luci-i18n-wol-no
	opkg remove luci-i18n-wol-sv
	opkg remove luci-i18n-wol-zh-cn
	opkg remove luci-app-wol
	opkg remove wol
}
uninstall_service_wifischedule () {
	opkg remove luci-i18n-wifischedule-pt-br
	opkg remove luci-i18n-wifischedule-it
	opkg remove luci-i18n-wifischedule-ja
	opkg remove luci-i18n-wifischedule-ru
	opkg remove luci-i18n-wifischedule-sv
    opkg remove luci-i18n-wifischedule-zh-cn
	opkg remove luci-app-wifischedule
	opkg remove wifischedule
}
uninstall_service_uugamebooster () {
	opkg remove luci-i18n-uugamebooster-zh-cn
	opkg remove luci-app-uugamebooster
	opkg remove uugamebooster
}
uninstall_service_frp () {
	opkg remove luci-i18n-frpc-zh-cn
	opkg remove luci-app-frpc
	opkg remove frpc
	opkg remove luci-i18n-frps-zh-cn
	opkg remove luci-app-frps
	opkg remove frps
}
uninstall_service_udpxy () {
	opkg remove luci-app-udpxy
	opkg remove udpxy
}
uninstall_service_vlmcsd () {
	opkg remove luci-i18n-vlmcsd-zh-cn
	opkg remove luci-app-vlmcsd
	opkg remove vlmcsd
}
uninstall_service_gost () {
	opkg remove luci-i18n-gost-zh-cn
	opkg remove luci-app-gost
	opkg remove gost
}
uninstall_service_xlnetacc () {
    opkg remove luci-i18n-xlnetacc-zh-cn
	opkg remove luci-app-xlnetacc
}
uninstall_service_shairplay () {
	opkg remove luci-app-shairplay
	opkg remove shairplay
}
uninstall_service_nps () {
	opkg remove luci-i18n-nps-zh-cn
	opkg remove luci-app-nps
}
uninstall_service_haproxy () {
    opkg remove luci-i18n-haproxy-tcp-zh-cn
    opkg remove luci-app-haproxy-tcp
	opkg remove haproxy
}
uninstall_service_uhttpd () {
    opkg remove luci-i18n-uhttpd-zh-cn
	opkg remove luci-app-uhttpd
}
uninstall_service_airplay2 () {
	opkg remove luci-i18n-airplay2-zh-cn
	opkg remove luci-app-airplay2
}
uninstall_service_v2ray_server () {
	opkg remove luci-i18n-v2ray-server-zh-cn
	opkg remove luci-app-v2ray-server
}
uninstall_service_adbyby () {
    opkg remove luci-i18n-adbyby-plus-zh-cn
    opkg remove luci-app-adbyby-plus
    opkg remove adbyby
}
uninstall_service_openclash () {
    opkg remove luci-app-openclash
}
uninstall_service_familycloud () {
    opkg remove luci-app-familycloud
}
uninstall_service_openvpn () {
    opkg remove luci-i18n-openvpn-zh-cn
    opkg remove luci-app-openvpn
    opkg remove openvpn-easy-rsa
    opkg remove openvpn-openssl
}
uninstall_service_kcptun () {
    opkg remove luci-i18n-kcptun-zh-cn
    opkg remove luci-app-kcptun
}
uninstall_service_passwall () {
    opkg remove luci-i18n-passwall-zh-cn
    opkg remove luci-app-passwall
}
uninstall_service_nlbwmon () {
	opkg remove luci-i18n-nlbwmon-ja
	opkg remove luci-i18n-nlbwmon-ru
    opkg remove luci-i18n-nlbwmon-zh-cn
    opkg remove luci-i18n-wrtbwmon-zh-cn
    opkg remove luci-app-wrtbwmon
    opkg remove luci-app-nlbwmon
    opkg remove nlbwmon
}
uninstall_service_guest_wifi () {
    opkg remove luci-i18n-guest-wifi-zh-cn
    opkg remove luci-app-guest-wifi
}
uninstall_service_pushbot () {
    opkg remove luci-app-pushbot
}
uninstall_service_speederv2 () {
    opkg remove luci-app-speederv2
    opkg remove udpspeederv2
}
uninstall_service_shairplay () {
	opkg remove luci-i18n-shairplay-pt-br
	opkg remove luci-i18n-shairplay-ru
	opkg remove luci-i18n-shairplay-ja
	opkg remove luci-app-shairplay
	opkg remove shairplay
}
uninstall_service_jd () {
	opkg remove luci-app-jd-dailybonus
}
uninstall_service_aliyundrive () {
	opkg remove luci-i18n-aliyundrive-webdav-zh-cn
	opkg remove luci-app-aliyundrive-webdav
	opkg remove aliyundrive-webdav
}
uninstall_service_mosdns () {
	opkg remove luci-i18n-mosdns-zh-cn
	opkg remove luci-app-mosdns
	opkg remove mosdns
}
uninstall_nas_filebrowser () {
    opkg remove luci-i18n-filebrowser-zh-cn
	opkg remove luci-app-filebrowser
}
uninstall_nas_kodexplorer () {
	opkg remove luci-i18n-kodexplorer-zh-cn
	opkg remove luci-app-kodexplorer
}
uninstall_nas_nfs () {
	opkg remove luci-i18n-nfs-zh-cn
	opkg remove luci-app-nfs
}
uninstall_nas_verysync () {
	opkg remove luci-i18n-verysync-zh-cn
	opkg remove luci-app-verysync
	opkg remove verysync
}
uninstall_nas_usb_printer () {
	opkg remove luci-i18n-usb-printer-zh-cn
	opkg remove luci-app-usb-printer
}
uninstall_nas_amule () {
	opkg remove luci-i18n-amule-zh-cn
	opkg remove luci-app-amule
	opkg remove amule
}
uninstall_nas_minidlna () {
	opkg remove luci-i18n-minidlna-fr
	opkg remove luci-i18n-minidlna-zh-tw
	opkg remove luci-i18n-minidlna-he
	opkg remove luci-i18n-minidlna-hu
	opkg remove luci-i18n-minidlna-it
	opkg remove luci-i18n-minidlna-ja
	opkg remove luci-i18n-minidlna-ms
	opkg remove luci-i18n-minidlna-no
	opkg remove luci-i18n-minidlna-pt-br
	opkg remove luci-i18n-minidlna-pl
	opkg remove luci-i18n-minidlna-pt
	opkg remove luci-i18n-minidlna-ro
	opkg remove luci-i18n-minidlna-ru
	opkg remove luci-i18n-minidlna-sk
	opkg remove luci-i18n-minidlna-sv
	opkg remove luci-i18n-minidlna-tr
	opkg remove luci-i18n-minidlna-uk
	opkg remove luci-i18n-minidlna-vi
	opkg remove luci-i18n-minidlna-ca
	opkg remove luci-i18n-minidlna-cs
	opkg remove luci-i18n-minidlna-de
	opkg remove luci-i18n-minidlna-el
	opkg remove luci-i18n-minidlna-es
    opkg remove luci-i18n-minidlna-zh-cn
	opkg remove luci-app-minidlna
	opkg remove minidlna
}
uninstall_nas_rclone () {
	opkg remove rclone-webui-react
	opkg remove rclone-ng
	opkg remove rclone-config
    opkg remove luci-i18n-rclone-zh-cn
	opkg remove luci-app-rclone
	opkg remove rclone
}
uninstall_nas_qBittorrent () {
    opkg remove luci-i18n-qbittorrent-zh-cn
	opkg remove luci-app-qbittorrent
	opkg remove qbittorrent
}
uninstall_nas_mjpg_streamer () {
	opkg remove luci-i18n-mjpg-streamer-pt-br
	opkg remove luci-i18n-mjpg-streamer-ja
	opkg remove luci-i18n-mjpg-streamer-ru
    opkg remove luci-i18n-mjpg-streamer-zh-cn
	opkg remove luci-app-mjpg-streamer
	opkg remove mjpg-streamer
}
uninstall_nas_baidupcs_web () {
	opkg remove luci-app-baidupcs-web
	opkg remove baidupcs-web
}
uninstall_nas_p910nd () {
    opkg remove luci-i18n-p910nd-zh-cn
    opkg remove luci-app-p910nd
    opkg remove p910nd
}
uninstall_nas_transmission () {
	opkg remove luci-i18n-transmission-zh-cn
	opkg remove luci-i18n-transmission-ms
	opkg remove luci-i18n-transmission-no
	opkg remove luci-i18n-transmission-pl
	opkg remove luci-i18n-transmission-pt
	opkg remove luci-i18n-transmission-ro
	opkg remove luci-i18n-transmission-ru
	opkg remove luci-i18n-transmission-sk
	opkg remove luci-i18n-transmission-sv
	opkg remove luci-i18n-transmission-tr
	opkg remove luci-i18n-transmission-uk
	opkg remove luci-i18n-transmission-vi
	opkg remove luci-i18n-transmission-zh-tw
	opkg remove luci-i18n-transmission-ca
	opkg remove luci-i18n-transmission-cs
	opkg remove luci-i18n-transmission-de
	opkg remove luci-i18n-transmission-el
	opkg remove luci-i18n-transmission-es
	opkg remove luci-i18n-transmission-fr
	opkg remove luci-i18n-transmission-he
	opkg remove luci-i18n-transmission-hu
	opkg remove luci-i18n-transmission-it
	opkg remove luci-i18n-transmission-pt-br
	opkg remove luci-i18n-transmission-ja
	opkg remove luci-app-transmission
	opkg remove transmission-web-control
	opkg remove transmission-daemon
}
uninstall_nas_vsftpd () {
	opkg remove luci-i18n-vsftpd-zh-cn
	opkg remove luci-app-vsftpd
	opkg remove vsftpd-alt
}
uninstall_nas_samba4 () {
	opkg remove luci-i18n-samba4-zh-cn
	opkg remove luci-app-samba4
	opkg remove samba4-server
}
uninstall_nas_cifsmount () {
	opkg remove luci-i18n-cifs-mount-zh-cn
	opkg remove luci-app-cifs-mount
	opkg remove cifsmount
}
uninstall_nas_hd_idle () {
	opkg remove luci-i18n-hd-idle-ca
	opkg remove luci-i18n-hd-idle-cs
	opkg remove luci-i18n-hd-idle-de
	opkg remove luci-i18n-hd-idle-el
	opkg remove luci-i18n-hd-idle-es
	opkg remove luci-i18n-hd-idle-fr
	opkg remove luci-i18n-hd-idle-zh-tw
	opkg remove luci-i18n-hd-idle-he
	opkg remove luci-i18n-hd-idle-hu
	opkg remove luci-i18n-hd-idle-it
	opkg remove luci-i18n-hd-idle-ja
	opkg remove luci-i18n-hd-idle-ms
	opkg remove luci-i18n-hd-idle-no
	opkg remove luci-i18n-hd-idle-pl
	opkg remove luci-i18n-hd-idle-pt
	opkg remove luci-i18n-hd-idle-pt-br
	opkg remove luci-i18n-hd-idle-ro
	opkg remove luci-i18n-hd-idle-ru
	opkg remove luci-i18n-hd-idle-sk
	opkg remove luci-i18n-hd-idle-sv
	opkg remove luci-i18n-hd-idle-tr
	opkg remove luci-i18n-hd-idle-uk
	opkg remove luci-i18n-hd-idle-vi
	opkg remove luci-i18n-hd-idle-zh-cn
	opkg remove luci-app-hd-idle
	opkg remove hd-idle
}
uninstall_nas_aria2 () {
	opkg remove luci-i18n-aria2-zh-tw
	opkg remove luci-i18n-aria2-ru
	opkg remove luci-i18n-aria2-sv
	opkg remove luci-i18n-aria2-pt-br
    opkg remove luci-i18n-aria2-zh-cn
    opkg remove luci-app-aria2
    opkg remove ariang
    opkg remove aria2
}
uninstall_nas_music_remote_center () {
	opkg remove luci-i18n-music-remote-center-zh-cn
	opkg remove luci-app-music-remote-center
}
uninstall_vpn_ssr_mudb_server () {
	opkg remove luci-i18n-ssr-mudb-server-zh-cn
	opkg remove luci-app-ssr-mudb-server
}
uninstall_vpn_ssrserve_python () {
	opkg remove luci-i18n-ssrserver-python-zh-cn
	opkg remove luci-app-ssrserver-python
}
uninstall_vpn_n2n_v2 () {
	opkg remove luci-i18n-n2n_v2-zh-cn
	opkg remove luci-app-n2n_v2
	opkg remove n2n-edge
	opkg remove n2n-supernode
}
uninstall_vpn_pptpd () {
	opkg remove luci-i18n-pptp-server-zh-cn
	opkg remove luci-app-pptp-server
	opkg remove pptpd
}
uninstall_vpn_softethervpn () {
	opkg remove luci-i18n-softethervpn-zh-cn
	opkg remove luci-app-softethervpn
	opkg remove softethervpn5-bridge
	opkg remove softethervpn5-client
	opkg remove softethervpn5-server
}
uninstall_vpn_ipsec_vpnd () {
	opkg remove luci-i18n-ipsec-vpnd-zh-cn
	opkg remove luci-app-ipsec-vpnd
	opkg remove luci-i18n-ipsec-server-zh-cn
	opkg remove luci-app-ipsec-server
}
uninstall_vpn_openvpn_server () {
	opkg remove luci-i18n-openvpn-server-zh-cn
	opkg remove luci-app-openvpn-server
}
uninstall_vpn_ocserv () {
	opkg remove luci-app-ocserv
	opkg remove ocserv
}
uninstall_vpn_udp2raw () {
	opkg remove luci-app-udp2raw
}
uninstall_vpn_zerotier () {
    opkg remove luci-i18n-zerotier-zh-cn
	opkg remove luci-app-zerotier
	opkg remove zerotier
}
uninstall_system_sqm () {
	opkg remove luci-i18n-sqm-ca
	opkg remove luci-i18n-sqm-cs
	opkg remove luci-i18n-sqm-de
	opkg remove luci-i18n-sqm-el
	opkg remove luci-i18n-sqm-es
	opkg remove luci-i18n-sqm-fr
	opkg remove luci-i18n-sqm-he
	opkg remove luci-i18n-sqm-hu
	opkg remove luci-i18n-sqm-it
	opkg remove luci-i18n-sqm-ja
	opkg remove luci-i18n-sqm-ko
	opkg remove luci-i18n-sqm-ms
	opkg remove luci-i18n-sqm-pl
	opkg remove luci-i18n-sqm-pt
	opkg remove luci-i18n-sqm-ro
	opkg remove luci-i18n-sqm-ru
	opkg remove luci-i18n-sqm-sk
	opkg remove luci-i18n-sqm-sv
	opkg remove luci-i18n-sqm-tr
	opkg remove luci-i18n-sqm-zh-tw
	opkg remove luci-i18n-sqm-uk
	opkg remove luci-i18n-sqm-vl
	opkg remove luci-i18n-sqm-vi
	opkg remove luci-i18n-sqm-zh-cn
	opkg remove luci-app-sqm
}
uninstall_system_socat () {
    opkg remove luci-i18n-socat-zh-cn
	opkg remove luci-app-socat
	opkg remove socat
}
uninstall_theme () {
    opkg remove luci-theme-argon-dark-mod
    opkg remove luci-theme-argon-light-mod
    opkg remove luci-theme-atmaterial_new
    opkg remove luci-theme-bootstrap-mod
	opkg remove luci-theme-atmaterial
	opkg remove luci-theme-darkmatter
	opkg remove luci-theme-edge
	opkg remove luci-theme-freifunk-generic
	opkg remove luci-theme-ifit
	opkg remove luci-theme-material
	opkg remove luci-theme-opentomato
	opkg remove luci-theme-opentomcat
	opkg remove luci-theme-opentopd
	opkg remove luci-theme-rosy
}

uninstall_plugin () {
    uninstall_overview_mwan
    uninstall_overview_wireguard
    uninstall_service_accesscontrol
    uninstall_service_adbyby
    uninstall_service_adguardhome
    uninstall_service_airplay2
    uninstall_service_aliyundrive
    uninstall_service_familycloud
    uninstall_service_frp
    uninstall_service_godproxy
    uninstall_service_gost
    uninstall_service_guest_wifi
    uninstall_service_haproxy
    uninstall_service_jd
    uninstall_service_kcptun
    uninstall_service_mosdns
    uninstall_service_nlbwmon
    uninstall_service_nps
    uninstall_service_openclash
    uninstall_service_openvpn
    uninstall_service_passwall
    uninstall_service_pushbot
    uninstall_service_serverchan
    uninstall_service_shairplay
    uninstall_service_smartdns
    uninstall_service_speederv2
    uninstall_service_udpxy
    uninstall_service_uhttpd
    uninstall_service_unblockmusic
    uninstall_service_uugamebooster
    uninstall_service_v2ray_server
    uninstall_service_vlmcsd
    uninstall_service_wifischedule
    uninstall_service_wol
    uninstall_service_xlnetacc
    uninstall_nas_amule
    uninstall_nas_aria2
    uninstall_nas_baidupcs_web
    uninstall_nas_cifsmount
    uninstall_nas_filebrowser
    uninstall_nas_hd_idle
    uninstall_nas_kodexplorer
    uninstall_nas_mjpg_streamer
    uninstall_nas_minidlna
    uninstall_nas_music_remote_center
    uninstall_nas_nfs
    uninstall_nas_p910nd
    uninstall_nas_qBittorrent
    uninstall_nas_rclone
    uninstall_nas_samba4
    uninstall_nas_transmission
    uninstall_nas_usb_printer
    uninstall_nas_verysync
    uninstall_nas_vsftpd
    uninstall_vpn_ipsec_vpnd
    uninstall_vpn_n2n_v2
    uninstall_vpn_ocserv
    uninstall_vpn_openvpn_server
    uninstall_vpn_pptpd
    uninstall_vpn_softethervpn
    uninstall_vpn_ssrserve_python
    uninstall_vpn_ssr_mudb_server
    uninstall_vpn_udp2raw
    uninstall_vpn_zerotier
    uninstall_system_autoreboot
    uninstall_system_sqm
    uninstall_system_socat
    uninstall_theme
}
uninstall_plugin
