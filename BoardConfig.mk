# Copyright (C) 2020 Paranoid Android
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

DEVICE_PATH := device/oneplus/oneplus8

TARGET_BOARD_PLATFORM := kona

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
TARGET_USE_QTI_BT_STACK := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona

# Display
TARGET_SCREEN_DENSITY := 420

# Fingerprint
TARGET_SURFACEFLINGER_FOD_LIB := //$(DEVICE_PATH):libfod_extension.oneplus8

# Gestures
TARGET_GESTURES_NODE := "/proc/touchpanel/gesture_enable"

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_oneplus8

# Kernel
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 \
    earlycon=msm_geni_serial,0xa90000 \
    androidboot.hardware=qcom \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    swiotlb=2048 \
    loop.max_part=7 \
    cgroup.memory=nokmem,nosocket \
    androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100

BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := vendor/kona-perf_defconfig
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/oneplus/sm8250

BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_KERNEL_SEPARATED_DTBO := false
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board ""

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

BOARD_SUPER_PARTITION_SIZE := 15032385536
BOARD_SUPER_PARTITION_GROUPS := oneplus_dynamic_partitions
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := product system
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 7511998464
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# VNDK
BOARD_VNDK_VERSION := current
