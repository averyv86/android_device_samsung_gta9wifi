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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Device identifier
PRODUCT_NAME := lineage_gta9wifi
PRODUCT_DEVICE := gta9wifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-X110
PRODUCT_MANUFACTURER := Samsung

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=gta9wifi \
    PRIVATE_BUILD_DESC="gta9wifi-user 13 TP1A.220624.014 X110XXU1AWL1 release-keys"

BUILD_FINGERPRINT := samsung/gta9wifi/gta9wifi:13/TP1A.220624.014/X110XXU1AWL1:user/release-keys

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-samsung
