# 提示
## 如果不清楚本仓库的代码的作用，请不要随意下载并运行
# 脚本说明
- 适用于骷髅头R4S_4G_Ext4格式的固件，进行在线升级。
```
wget https://raw.githubusercontent.com/lone-wind/scripts/main/autoupdate.sh && sh autoupdate.sh
```
- 适用于骷髅头R2S/R4S的Ext4或Squashfs格式的固件，进行在线升级（已验证，对1g内存 测试算是失败了）。
```
wget https://raw.githubusercontent.com/lone-wind/scripts/main/onlineupdate.sh && sh onlineupdate.sh
```
- 适用于F大 Arm盒子+Op固件，Docker安装双ADG容器。
```
wget https://raw.githubusercontent.com/lone-wind/scripts/main/adg.sh && sh adg.sh
```
- 适用于F大 Arm盒子+Op固件，精简插件，保留最重要的SSRP+动态DNS。
```
wget https://raw.githubusercontent.com/lone-wind/scripts/main/remove.sh && sh remove.sh
```
