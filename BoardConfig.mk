#
# Copyright 2018 The Android Open Source Project
# Copyright 2019 The PixelExperience Project
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

BOARD_VENDOR := xiaomi

DEVICE_PATH := device/xiaomi/laurel_sprout

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vbmeta \
    vendor \
    dtbo \
    modem \
    abl \
    bluetooth \
    cmnlib \
    cmnlib64 \
    devcfg \
    dsp \
    hyp \
    imagefv \
    keymaster \
    qupfw \
    rpm \
    storsec \
    tz \
    uefisecapp \
    xbl \
    xbl_config

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# Flag for kernel headers generator
BOARD_USES_QCOM_HARDWARE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := trinket
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_NO_BOOTLOADER := true

# Broken Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
RELAX_USES_LIBRARY_CHECK := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 lpm_levels.sleep_disabled=1 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 firmware_class.path=/vendor/firmware_mnt/image earlycon=msm_geni_serial,0x4a90000 loop.max_part=16 cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += androidboot.vbmeta.avb_version=1.0
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := vendor/laurel_sprout-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/laurel_sprout
TARGET_KERNEL_NO_LLVM_BINUTILS := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true


# Platform
TARGET_BOARD_PLATFORM := trinket
TARGET_BOARD_PLATFORM_GPU := qcom-adreno610

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT := true
    DONT_DEXPREOPT_PREBUILTS := true
  endif
endif

# Display	
TARGET_SCREEN_DENSITY := 320

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Power
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp
TARGET_USES_INTERACTION_BOOST := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# FM
BOARD_HAVE_QCOM_FM := true
BOARD_HAS_QCA_FM_SOC := "cherokee"

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
TARGET_USES_HWC2 := true

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml

# Partitions
BOARD_USES_METADATA_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x0800000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115869577216 # 128 Gb variant
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_SUPPRESS_EMMC_WIPE := true

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Root
BOARD_ROOT_EXTRA_FOLDERS := odm
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/bt_firmware:/bt_firmware \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

# RIL
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Sepolicy
SELINUX_IGNORE_NEVERALLOWS := true
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

SYSTEM_EXT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy/generic/private \
    device/qcom/sepolicy/qva/private

SYSTEM_EXT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy/generic/public \
    device/qcom/sepolicy/generic/public/attribute \
    device/qcom/sepolicy/qva/public \
    device/qcom/sepolicy/qva/public/attribute

# Treble
BUILD_WITHOUT_VENDOR := true
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_SEPOLICY_SPLIT_OVERRIDE := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

# Vendor init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_laurel_sprout
TARGET_RECOVERY_DEVICE_MODULES := libinit_laurel_sprout

# qssi.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/qssi.prop

# Inherit from the proprietary version
-include vendor/xiaomi/laurel_sprout/BoardConfigVendor.mk

# Unpack vendor images
include vendor/xiaomi/laurel_sprout-images/unpack-images.mk

# Include prebuilt vendor
include vendor/xiaomi/laurel_sprout-images/vendor-image.mk
