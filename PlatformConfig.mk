# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm8226
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

BOARD_USES_QCOM_HARDWARE := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

TARGET_KERNEL_SOURCE := kernel/sony/msm8226

BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += user_debug=31 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE += sched_enable_power_aware=1

BOARD_KERNEL_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1962934272
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5460983808
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Init
TARGET_INIT_VENDOR_LIB := libinit_yukon
TARGET_RECOVERY_DEVICE_MODULES := libinit_yukon

# GFX
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true

# FM
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# GPS definitions for Qualcomm solution
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Wi-Fi definitions for Qualcomm solution
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# BT definitions for Qualcomm solution
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/yukon/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# NFC
BOARD_NFC_CHIPSET := pn547

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Set seccomp policy for media server
BOARD_SECCOMP_POLICY += device/sony/yukon/seccomp

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/sony/yukon/overlay

# System Props
TARGET_SYSTEM_PROP += device/sony/yukon/system.prop

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE :=  device/sony/yukon/manifest.xml

 # SELinux
#include device/qcom/sepolicy/sepolicy.mk

#BOARD_SEPOLICY_DIRS += device/sony/yukon/sepolicy

