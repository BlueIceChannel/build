#Rockchip RK3588j Octa core 4GB-32GB Bluetooth DP eMMC GBE HDMI HDMI-IN MIPI PCIe SATA USB3 WiFi
BOARD_NAME="ROC-RK3588S-PC"
BOARD_VENDOR="firefly"
BOARDFAMILY="rockchip-rk3588"
BOARD_MAINTAINER=""
BOOTCONFIG="rock-5b-rk3588_defconfig"
KERNEL_TARGET="current,vendor"
BOOT_FDT_FILE="rockchip/rk3588s-roc-pc.dtb"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_SCENARIO="spl-blobs"
IMAGE_PARTITION_TABLE="gpt"

function post_family_tweaks__station-m3_naming_audios() {
	display_alert "$BOARD" "Renaming station-m3 audios" "info"

	mkdir -p $SDCARD/etc/udev/rules.d/
	echo 'SUBSYSTEM=="sound", ENV{ID_PATH}=="platform-hdmi0-sound", ENV{SOUND_DESCRIPTION}="HDMI0 Audio"' > $SDCARD/etc/udev/rules.d/90-naming-audios.rules
	echo 'SUBSYSTEM=="sound", ENV{ID_PATH}=="platform-dp0-sound", ENV{SOUND_DESCRIPTION}="DP0 Audio"' >> $SDCARD/etc/udev/rules.d/90-naming-audios.rules
	echo 'SUBSYSTEM=="sound", ENV{ID_PATH}=="platform-es8388-sound", ENV{SOUND_DESCRIPTION}="ES8388 Audio"' >> $SDCARD/etc/udev/rules.d/90-naming-audios.rules

	return 0
}
