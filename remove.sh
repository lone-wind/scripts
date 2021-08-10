#Build by lone-wind
opkg list_installed
uninstall_overview_wireguard () {
	opkg remove kmod-wireguard
	opkg remove luci-app-wireguard
	opkg remove luci-i18n-wireguard-zh-cn
	opkg remove luci-proto-wireguard
	opkg remove wireguard-tools
}
uninstall_overview_mwan () {
	opkg remove luci-app-mwan3
	opkg remove luci-app-mwan3helper
	opkg remove luci-i18n-mwan3-zh-cn
	opkg remove luci-i18n-mwan3helper-zh-cn
	opkg remove mwan3
}
uninstall_system_autoreboot () {
	opkg remove luci-app-autoreboot
	opkg remove luci-i18n-autoreboot-zh-cn
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
	opkg remove luci-app-accesscontrol
	opkg remove luci-i18n-accesscontrol-zh-cn
}
uninstall_service_unblockmusic () {
	opkg remove luci-app-unblockmusic
	opkg remove luci-i18n-unblockmusic-zh-cn
	opkg remove UnblockNeteaseMusic
	opkg remove UnblockNeteaseMusic-Go
}
uninstall_service_smartdns () {
	opkg remove luci-app-smartdns
	opkg remove luci-i18n-smartdns-zh-cn
	opkg remove smartdns
}
uninstall_service_wol () {
	opkg remove luci-app-wol
	opkg remove luci-i18n-wol-zh-cn
	opkg remove wol
}
uninstall_service_wifischedule () {
	opkg remove luci-app-wifischedule
	opkg remove luci-i18n-wifischedule-zh-cn
	opkg remove wifischedule
}
uninstall_service_uugamebooster () {
	opkg remove luci-app-uugamebooster
	opkg remove luci-i18n-uugamebooster-zh-cn
	opkg remove uugamebooster
}
uninstall_service_frp () {
	opkg remove frpc
	opkg remove frps
	opkg remove luci-app-frpc
	opkg remove luci-app-frps
	opkg remove luci-i18n-frpc-zh-cn
	opkg remove luci-i18n-frps-zh-cn
}
uninstall_service_udpxy () {
	opkg remove luci-app-udpxy
	opkg remove udpxy
}
uninstall_service_vlmcsd () {
	opkg remove luci-app-vlmcsd
	opkg remove luci-i18n-vlmcsd-zh-cn
	opkg remove vlmcsd
}
uninstall_service_gost () {
	opkg remove gost
	opkg remove luci-app-gost
}
uninstall_service_xlnetacc () {
	opkg remove luci-app-xlnetacc
}
uninstall_service_shairplay () {
	opkg remove luci-app-shairplay
	opkg remove shairplay
}
uninstall_service_nps () {
	opkg remove luci-app-nps
	opkg remove luci-i18n-nps-zh-cn
}
uninstall_service_haproxy () {
	opkg remove haproxy
	opkg remove luci-app-haproxy-tcp
	opkg remove luci-i18n-haproxy-tcp-zh-cn
}
uninstall_service_uhttpd () {
	opkg remove luci-app-uhttpd
	opkg remove luci-i18n-uhttpd-tcp-zh-cn
}
uninstall_service_airplay2 () {
	opkg remove luci-app-airplay2
	opkg remove luci-i18n-airplay2-zh-cn
}
uninstall_service_v2ray_server () {
	opkg remove luci-app-v2ray-server
	opkg remove luci-i18n-v2ray-server-zh-cn
}
uninstall_nas_filebrowser () {
	opkg remove luci-app-filebrowser
	opkg remove luci-i18n-filebrowser-zh-cn
}
uninstall_nas_kodexplorer () {
	opkg remove luci-app-kodexplorer
	opkg remove luci-i18n-kodexplorer-zh-cn
}
uninstall_nas_nfs () {
	opkg remove luci-app-nfs
	opkg remove luci-i18n-nfs-zh-cn
}
uninstall_nas_verysync () {
	opkg remove luci-app-verysync
	opkg remove luci-i18n-verysync-zh-cn
	opkg remove verysync
}
uninstall_nas_usb_printer () {
	opkg remove luci-app-usb-printer
	opkg remove luci-i18n-usb-printer-zh-cn
}
uninstall_nas_amule () {
	opkg remove amule
	opkg remove luci-app-amule
	opkg remove luci-i18n-amule-zh-cn
}
uninstall_nas_minidlna () {
	opkg remove luci-app-minidlna
	opkg remove luci-i18n-minidlna-zh-cn
	opkg remove minidlna
}
uninstall_nas_rclone () {
	opkg remove luci-app-rclone
	opkg remove luci-i18n-rclone-zh-cn
	opkg remove rclone
}
uninstall_nas_qBittorrent () {
	opkg remove luci-app-qbittorrent
	opkg remove luci-i18n-qbittorrent-zh-cn
	opkg remove qbittorrent
}
uninstall_nas_mjpg_streamer () {
	opkg remove luci-app-mjpg-streamer
	opkg remove luci-i18n-mjpg-streamer-zh-cn
	opkg remove mjpg-streamer
}
uninstall_nas_baidupcs_web () {
	opkg remove baidupcs-web
	opkg remove luci-app-baidupcs-web
}
uninstall_nas_transmission () {
	opkg remove luci-app-transmission
	opkg remove luci-i18n-transmission-zh-cn
	opkg remove transmission-web-control
}
uninstall_nas_vsftpd () {
	opkg remove luci-app-vsftpd
	opkg remove luci-i18n-vsftpd-zh-cn
}
uninstall_nas_samba4 () {
	opkg remove luci-app-samba4
	opkg remove luci-i18n-samba4-zh-cn
	opkg remove samba4-server
}
uninstall_nas_cifsmount () {
	opkg remove cifsmount
	opkg remove luci-app-cifs-mount
	opkg remove luci-i18n-cifs-mount-zh-cn
}
uninstall_nas_hd_idle () {
	opkg remove hd-idle
	opkg remove luci-app-hd-idle
	opkg remove luci-i18n-hd-idle-zh-cn
}
uninstall_nas_music_remote_center () {
	opkg remove luci-app-music-remote-center
	opkg remove luci-i18n-music-remote-center-zh-cn
}
uninstall_vpn_ssr_mudb_server () {
	opkg remove luci-app-ssr-mudb-server
	opkg remove luci-i18n-ssr-mudb-server-zh-cn
}
uninstall_vpn_ssrserve_python () {
	opkg remove luci-app-ssrserver-python
	opkg remove luci-i18n-ssrserver-python-zh-cn
}
uninstall_vpn_n2n_v2 () {
	opkg remove luci-app-n2n_v2
	opkg remove luci-i18n-n2n_v2-zh-cn
}
uninstall_vpn_pptpd () {
	opkg remove luci-app-pptp-server
	opkg remove luci-i18n-pptp-server-zh-cn
	opkg remove pptpd
}
uninstall_vpn_softethervpn () {
	opkg remove luci-app-softethervpn
	opkg remove luci-i18n-softethervpn-zh-cn
	opkg remove softethervpn5-bridge
	opkg remove softethervpn5-client
	opkg remove softethervpn5-server
}
uninstall_vpn_ipsec_vpnd () {
	opkg remove luci-app-ipsec-vpnd
	opkg remove luci-i18n-ipsec-vpnd-zh-cn
}
uninstall_vpn_openvpn_server () {
	opkg remove luci-app-openvpn-server
	opkg remove luci-i18n-openvpn-server-zh-cn
}
uninstall_vpn_ocserv () {
	opkg remove luci-app-ocserv
	opkg remove ocserv
}
uninstall_vpn_udp2raw () {
	opkg remove luci-app-udp2raw
}
uninstall_vpn_zerotier () {
	opkg remove luci-app-zerotier
	opkg remove luci-i18n-zerotier-zh-cn
	opkg remove zerotier
}
uninstall_system_sqm () {
	opkg remove luci-app-sqm
	opkg remove luci-i18n-sqm-zh-cn
}
uninstall_system_socat () {
	opkg remove luci-app-socat
	opkg remove luci-i18n-socat-zh-cn
	opkg remove socat
}
uninstall_theme () {
	opkg remove luci-theme-rosy
	opkg remove luci-theme-atmaterial
	opkg remove luci-theme-argon_new
	opkg remove luci-theme-bootstrap
	opkg remove luci-theme-bootstrap-mod
	opkg remove luci-theme-edge
	opkg remove luci-theme-ifit
	opkg remove luci-theme-material
	opkg remove luci-theme-opentomato
	opkg remove luci-theme-opentomcat
	opkg remove luci-theme-opentopd
}

uninstall_plugin () {
    uninstall_overview_mwan
    uninstall_overview_wireguard
    uninstall_service_accesscontrol
    uninstall_service_adguardhome
    uninstall_service_airplay2
    uninstall_service_frp
    uninstall_service_godproxy
    uninstall_service_gost
    uninstall_service_haproxy
    uninstall_service_nps
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
    uninstall_nas_baidupcs_web
    uninstall_nas_cifsmount
    uninstall_nas_filebrowser
    uninstall_nas_hd_idle
    uninstall_nas_kodexplorer
    uninstall_nas_mjpg_streamer
    uninstall_nas_minidlna
    uninstall_nas_music_remote_center
    uninstall_nas_nfs
    uninstall_nas_qBittorrent
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
    uninstall_system_socat
    uninstall_system_socat
}
uninstall_plugin
