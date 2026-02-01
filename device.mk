#
# Copyright (C) 2024 The LineageOS Project
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
#

DEVICE_PATH := device/samsung/gta9wifi

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1340
TARGET_SCREEN_WIDTH := 800

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudiofoundation.vendor \
    libtinycompress

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    libcamera2ndk_vendor

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0.vendor \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@4.0.vendor \
    libdrm.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl-2.1

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0.vendor \
    android.hidl.memory.block@1.0.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor

# Init
PRODUCT_PACKAGES += \
    init.mt6789.rc \
    init.recovery.mt6789.rc \
    fstab.mt6789 \
    ueventd.mt6789.rc

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.samsung

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlay \
    SystemUIOverlay

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.mediatek-libperfmgr

# Properties
include $(DEVICE_PATH)/vendor.prop

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt6789.rc

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 33

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.mediatek

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.samsung

# VNDK
PRODUCT_PACKAGES += \
    libutils-v32

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-mt66xx \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf

# Inherit from the proprietary version
$(call inherit-product, vendor/samsung/gta9wifi/gta9wifi-vendor.mk)
