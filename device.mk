# Copyright (C) 2020 Paranoid Android
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

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Apex
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    product \
    system \
    vbmeta \
    vbmeta_system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.kona

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.kona \
    libcutils \
    librecovery_updater_msm \
    libz

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.oneplus8

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lights/android.hardware.light@2.0-service.rc:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/android.hardware.light@2.0-service.rc

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/oneplus/oneplus8

# Overlays
PRODUCT_PACKAGES += \
    OnePlus8SeriesBluetooth \
    OnePlus8SeriesCarrierConfig \
    OnePlus8SeriesFrameworks

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    av \
    bt \
    perf \
    telephony \
    wfd

# Rootdir
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor
$(call inherit-product, vendor/oneplus/oneplus8/oneplus8-vendor.mk)
