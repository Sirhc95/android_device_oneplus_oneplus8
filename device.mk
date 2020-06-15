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

# Alert Slider
PRODUCT_PACKAGES += \
    TriStateHandler \
    tri-state-key_daemon

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_qti

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

# Doze
PRODUCT_PACKAGES += \
    ParanoidDoze

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    vendor.pa.biometrics.fingerprint.inscreen@1.0-service.oneplus8

PRODUCT_COPY_FILES += \
    vendor/pa/config/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Keylayout
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/fpc1020.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/fpc1020.kl \
	$(LOCAL_PATH)/keylayout/gf_input.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gf_input.kl \
	$(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

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
    AOSPAOnePlus8SeriesFrameworks \
    AOSPAOnePlus8SeriesSettings \
    AOSPAOnePlus8SeriesSystemUI \
    OnePlus8Frameworks \
    OnePlus8ProFrameworks \
    OnePlus8ProSystemUI \
    OnePlus8SeriesBluetooth \
    OnePlus8SeriesCarrierConfig \
    OnePlus8SeriesFrameworks \
    OnePlus8SystemUI

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Performance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perfconfigstore.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/perf/perfconfigstore.xml

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    audio \
    av \
    bt \
    display \
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
