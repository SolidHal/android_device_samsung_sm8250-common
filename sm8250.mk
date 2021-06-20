# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Proprietary blobs
$(call inherit-product-if-exists, vendor/samsung/sm8250-common/sm8250-common-vendor.mk)

COMMON_PATH := device/samsung/sm8250-common
CONFIG_PATH := $(COMMON_PATH)/config
TARGET_COPY_OUT_VENDOR_OVERLAY ?= $(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \
    hardware/google/pixel/power-libperfmgr \
    hardware/samsung/hidl/power-libperfmgr

# Overlays
PRODUCT_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(COMMON_PATH)/overlay-lineage/lineage-sdk

# GSI AVB Public Keys
PRODUCT_PACKAGES += \
    q-gsi.avbpubkey \
    r-gsi.avbpubkey \
    s-gsi.avbpubkey


# HIDL

PRODUCT_PACKAGES += \
   libhidltransport \
   libhidltransport.vendor \
   libhwbinder \
   libhwbinder.vendor

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/vendor_override_manifest.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/vintf/manifest/vendor_override_manifest.xml


# Audio
PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/audio_policy_configuration.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.service

# Camera
PRODUCT_PACKAGES += \
    Snap
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(COMMON_PATH)/overlay-lineage/packages/apps/Snap

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.samsung-sm8250 \
    vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung-sm8250


PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/permissions/android.hardware.fingerprint.xml \

# Init Resources
PRODUCT_PACKAGES += \
    init.qcom.rc \
    fstab.qcom \
    gsi_skip_mount.cfg

# # Skip Mount
# PRODUCT_COPY_FILES += \
#     $(COMMON_PATH)/skip_mount.cfg:system/etc/init/config/skip_mount.cfg

### LIGHT
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.samsung

### LIVEDISPLAY
PRODUCT_PACKAGES+= \
    vendor.lineage.livedisplay@2.0-service.samsung-exynos

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3-service.samsung-libperfmgr

PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/powerhint.json

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc \
    fastbootd

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.samsung-multihal

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml

### SOUNDTRIGGER
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.0-impl

### THERMAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.samsung

### TOUCH HAL
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.samsung

### USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.typec

### USB TRUST HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

### VIBRATOR
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.3-service.samsung

# Vendor Services - DISABLED
PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/init.vendor.qti.spu@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/pa_daemon_qsee.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.biometrics.face@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.biometrics.face@2.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.media.converter@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.miscpower@2.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.snap@1.1-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.soter@3.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.arcounter@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.atn@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.ddar@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.hdm@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.hdm@1.1-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.iccc@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.payment@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.tima@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.ucm@1.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vendor.samsung.hardware.tlc.ucm@2.0-service.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vk_common.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/vk_qsee.rc \
    $(CONFIG_PATH)/etc/empty:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/wsm-service.rc \
    $(CONFIG_PATH)/etc/excluded_hardware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/excluded_hardware.xml


#ODM
PRODUCT_COPY_FILES += \
 $(CONFIG_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_ODM)/etc/media_profiles_V1_0.xml


# Platform packages and permission
include $(COMMON_PATH)/platform/init.mk
include $(COMMON_PATH)/platform/permissions.mk
include $(COMMON_PATH)/platform/product_packages.mk
include $(COMMON_PATH)/platform/recovery.mk

# Properties
include $(COMMON_PATH)/vendor_prop.mk



