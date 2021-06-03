
COMMON_PATH := device/samsung/sm8250-common
CONFIG_PATH := $(COMMON_PATH)/config

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.service

# Camera
PRODUCT_PACKAGES += \
    Snap
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(COMMON_PATH)/overlay-lineage/packages/apps/Snap

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.samsung \
# Fingerprint Inscreen
PRODUCT_PACKAGES += \
    vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag


# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3-service.samsung-libperfmgr

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.samsung-multihal
