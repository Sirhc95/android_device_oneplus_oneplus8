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

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Init
PRODUCT_PACKAGES += \
    init.oneplus.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc

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
    CarrierConfigResCommon \
    CellBroadcastReceiverResCommon \
    EmptyOverlay \
    FrameworksResCommon \
    OnePlus8Frameworks \
    OnePlus8ProFrameworks \
    OnePlus8ProSystemUI \
    OnePlus8SystemUI \
    SystemUIResCommon \
    TelecommResCommon \
    TelephonyResCommon \
    WifiResCommon

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := kona

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    audio \
    av \
    bt \
    display \
    gps \
    perf \
    wfd

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier
