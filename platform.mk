# Copyright (C) 2014 The Android Open Source Project
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

SOMC_PLATFORM := yukon

SONY_ROOT:= device/sony/yukon/rootdir

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/sony/yukon/overlay \
    device/sony/yukon/overlay-lineage

PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.model \
    ro.product.name \
    ro.build.product

# Common init
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/init.common.rc:root/init.common.rc \
    $(SONY_ROOT)/init.common.usb.rc:root/init.common.usb.rc

# USB HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(SONY_ROOT)/system/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf

# QMI
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/data/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(SONY_ROOT)/system/etc/data/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(SONY_ROOT)/system/etc/data/qmi_config.xml:system/etc/data/qmi_config.xml

# Qualcom WiFi
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/vendor/etc/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/system/vendor/etc/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom BT
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Yukon etc
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/gps.conf:system/etc/gps.conf \
    $(SONY_ROOT)/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(SONY_ROOT)/system/etc/sec_config:system/etc/sec_config \
    $(SONY_ROOT)/system/etc/sensors/sensors_settings:system/etc/sensors/sensors_settings

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/msm8226-tapan-snd-card_Button_Jack.kl:system/usr/keylayout/msm8226-tapan-snd-card_Button_Jack.kl \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Keymaster HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Platform Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# APN list
PRODUCT_COPY_FILES += \
    device/sample/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml \
    device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Platform Init
PRODUCT_PACKAGES += \
    init.yukon.pwr

# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

# NFC HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8226 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler

# For audio.primary
PRODUCT_PACKAGES += \
    libtinyalsa \
    libtinycompress \
    libaudioroute \
    tinymix

# Audio HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

# FM radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8226 \
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    memtrack.msm8226 \
    libhdmi \
    libqdutils \
    libqdMetaData

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# Display HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl

# Lights HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl

# Vibrator HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# Sensors HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# Bluetooth package
PRODUCT_PACKAGES += \
    libbt-vendor

# Bluetooth HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226 \
    libloc_api_v02 \
    libloc_core \
    libloc_eng \
    libgps.utils

# GPS HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl

# WLAN
PRODUCT_PACKAGES += \
    p2p_supplicant.conf \
    wificond \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf \
    wcnss_service

# WiFi HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

# CAMERA
PRODUCT_PACKAGES += \
    camera.msm8226 \
    libmmcamera_interface \
    libmmjpeg_interface \
    libmm-qcamera \
    libqomx_core

# Camera HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-legacy \
    camera.device@1.0-impl-legacy

# Snap
PRODUCT_PACKAGES += \
    Snap

# OSS
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep \
    macaddrsetup

# QCOM OSS
PRODUCT_PACKAGES += \
   librmnetctl

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# AOSP Packages
PRODUCT_PACKAGES += \
    Launcher3

PRODUCT_PACKAGES += \
    libion \
    libxml2

PRODUCT_PACKAGES += \
    libemoji

# RIL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

# Inherit common Android Go configurations
$(call inherit-product, build/target/product/go_defaults.mk)

# Include QCOM proprietary
$(call inherit-product-if-exists, vendor/qcom/proprietary/proprietary.mk)
