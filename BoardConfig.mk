#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/motorola/victara_retcn/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/victara_retcn

BOARD_VENDOR := motorola-qcom

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := victara,victara_retcn

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
BOARD_USES_QCOM_HARDWARE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true

USE_CLANG_PLATFORM_BUILD := true
WITHOUT_HOST_CLANG := false

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/motorola/victara_retcn/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom msm_rtb.filter=0x37 ehci-hcd.park=3 vmalloc=400M
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_SOURCE := kernel/motorola/victara_retcn
TARGET_KERNEL_CONFIG := cyanogenmod_victara_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Audio
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_EXTERNAL_SPEAKER := true
AUDIO_FEATURE_ENABLED_USBAUDIO := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true

# Camera
COMMON_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true

# Hardware
BOARD_HARDWARE_CLASS := device/motorola/victara_retcn/mkhw

# Init
TARGET_NR_SVC_SUPP_GIDS := 32

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10444800
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 11526720
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2046820352
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13107068928

# Power HAL
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support

# Recovery
#RECOVERY_VARIANT := twrp
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_NOT_USE_GZIP_RECOVERY_RAMDISK := true
BOARD_HAS_NO_SELECT_BUTTON := true

ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
else
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/recovery.fstab
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_CRYPTO := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_KERNEL_CONFIG := cyanogenmod_victara_recovery_defconfig
endif

# Ril
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RILD := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/motorola/victara_retcn/sepolicy

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_victara
TARGET_LIBINIT_DEFINES_FILE := device/motorola/victara_retcn/init/init_victara.cpp

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA   := "sta"
WIFI_DRIVER_FW_PATH_AP    := "ap"

WITH_DEXPREOPT := true
WITH_DEXPREOPT_COMP := false
