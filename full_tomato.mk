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
#

# Inherit from those products. Most specific first.
ifneq ($(TOMATO_32_BIT),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
endif

TARGET_LOCALES := en_US en_IN en_GB hi_IN mr_IN ml_IN ta_IN kn_IN te_IN

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from tomato device
$(call inherit-product, device/yu/tomato/device.mk)

# Build Gecko as 32bit (64bit is not yet implemented)
BUILD_MULTILIB_GECKO_AS_2ND_ARCH := true

# for Gecko to use the correct resolution assets
# Valid options are: 1.5 | 2 | 2.25
GAIA_DEV_PIXELS_PER_PX := 2

# for Gecko to use the correct boot animation
# Valid options are: hvga | fwvga | qHD | 720p | 1080p
BOOTANIMATION_ASSET_SIZE := 720p

# for Gonk to support Camera blobs
PRODUCT_PACKAGES += \
    libandroid

PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=0

# for Gecko to support usb mass storage
# You may need to add mass_storage to init.oem.usb.rc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

# Use QCOM bluetooth HAL
BOARD_BLUETOOTH_BDROID_USE_CAF_EXTENSIONS := true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := tomato
PRODUCT_NAME := full_tomato
PRODUCT_BRAND := YU
PRODUCT_MODEL := Yureka
PRODUCT_MANUFACTURER := YU
