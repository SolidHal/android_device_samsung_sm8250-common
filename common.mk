#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Force disable updating of APEXes when flatten APEX flag is enabled
ifeq ($(OVERRIDE_TARGET_FLATTEN_APEX),true)
PRODUCT_PRODUCT_PROPERTIES += ro.apex.updatable=false
endif

# Enable virtual A/B OTA
# $(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/sm8250-common/sm8250-common-vendor.mk)


# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/samsung/hidl/fastcharge \
    hardware/samsung/ril/libsecril-client \
    $(LOCAL_PATH)/power-libperfmgr \
    $(LOCAL_PATH)/libperfmgr \
    vendor/qcom/opensource/interfaces/camera/postproc/1.0

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *

# samsung framework - required for imsservice.apk aka some telephony things
# this jar is provided by the vendor package
PRODUCT_BOOT_JARS += framework-samsung

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_USE_PRODUCT_VNDK_OVERRIDE := true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_11/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_9/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.picture_in_picture.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml


# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.effect@2.0 \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@5.0 \
    android.hardware.audio.effect@6.0 \
    android.hardware.audio.common@6.0 \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@2.0 \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@4.0-impl \
    android.hardware.audio@5.0-impl \
    android.hardware.audio@6.0-impl \
    android.hardware.audio@6.0 \
    android.hardware.audio@5.0 \
    android.hardware.audio@4.0 \
    android.hardware.audio@2.0 \
    android.hardware.audio.service \
    android.hardware.audio.common-util \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.soundtrigger@2.1-impl \
    android.hardware.soundtrigger@2.2-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.primary.kona \
    audio.r_submix.default \
    audio.usb.default \
    liba2dpoffload \
    libaudiopreprocessing \
    libbatterylistener \
    libbundlewrapper \
    libcirrusspkrprot \
    libcomprcapture \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libsndmonitor \
    libspkrprot \
    libvisualizer \
    libvolumelistener \
    libaudiofoundation \
    libcodec2_hidl@1.1 \
    libcodec2_sec_aacdec.so \
    libcodec2_sec_aacenc.so \
    libcodec2_sec_amrnbdec.so \
    libcodec2_sec_amrwbdec.so \
    libcodec2_sec_evrcdec.so \
    libcodec2_sec_evrcenc.so \
    libcodec2_sec_flacdec.so \
    libcodec2_sec_imadec.so \
    libcodec2_sec_mp3dec.so \
    libcodec2_sec_mp43dec.so \
    libcodec2_sec_mp4vdec.so \
    libcodec2_sec_qcelpdec.so \
    libcodec2_sec_qcelpenc.so \
    libcodec2_sec_soft_common.so \
    libcodec2_sec_vc1dec.so \
    libcodec2_sec_wmadec.so \
    libcodec2_sec_wmv7dec.so \
    libcodec2_sec_wmv8dec.so \
    libcodec2_simple_component.so \
    libcodec2_soft_ac4dec.so \
    libcodec2_soft_common.so \
    libcodec2_soft_eac3dec.so


# Automotive/Gearhead
PRODUCT_PACKAGES += \
    android.hardware.automotive.vehicle@2.0 \
    android.hardware.automotive.vehicle@2.0-manager-lib


# Camera
PRODUCT_PACKAGES += \
    vendor.qti.hardware.camera \
    android.hardware.camera.common@1.0 \
    android.hardware.camera.device@1.0 \
    android.hardware.camera.device@3.2 \
    android.hardware.camera.device@3.3 \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.device@3.5 \
    android.hardware.camera.device@3.6 \
    android.hardware.camera.provider@2.4 \
    android.hardware.camera.provider@2.6 \
    android.hardware.camera.provider@2.5 \
    android.hardware.camera.provider@2.4-legacy \
    android.hardware.camera.provider@2.5-legacy \
    vendor.qti.hardware.camera.postproc@1.0 \
    vendor.qti.hardware.camera.postproc@1.0.vendor \
    libcamera2ndk_vendor \
    libgui_vendor \
    Snap


# Main init and fstab
PRODUCT_PACKAGES += \
    init.qcom.rc.sys \
    fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# Common init scripts
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.mdm.sh \
    init.crda.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qti.media.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \
    init.qti.dcvs.sh \
    init.qti.qcv.sh \
    init.qti.fm.sh \
    init.qti.fm.sh_init \
    init.nfc.samsung.rc \
    init.qcom.rc \
    init.qcom.factory.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
    init.samsung.bsp.rc \
    init.samsung.display.rc \
    init.samsung.eif.rc \
    init.samsung.rc \
    init.target.rc \
    init.qti.fm.rc \
    init.qti.media.rc \
    init.qti.qcv.rc \
    init.x1q.rc \
    ueventd.qcom.rc

# Component overrides
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0

# Cryptfs
PRODUCT_PACKAGES += \
    libcryptfs_hw \
    vendor.qti.hardware.cryptfshw@1.0

# Dex
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0 \
    android.hardware.graphics.mapper@3.0 \
    android.hardware.graphics.mapper@4.0 \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.kona \
    libdisplayconfig.qti \
    libdisplayconfig.qti.vendor \
    libgralloc.qti \
    libqdMetaData \
    libsdedrm \
    libsdmcore \
    libsdmutils \
    libtinyxml \
    libvulkan \
    memtrack.kona \
    vendor.display.config@1.0 \
    vendor.display.config@1.1 \
    vendor.display.config@1.2 \
    vendor.display.config@1.3 \
    vendor.display.config@1.4 \
    vendor.display.config@1.5 \
    vendor.display.config@2.0 \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor \
    vendor.display.config@1.5.vendor \
    vendor.display.config@1.6.vendor \
    vendor.display.config@1.7.vendor \
    vendor.display.config@1.8.vendor \
    vendor.display.config@1.9.vendor \
    vendor.display.config@1.10.vendor \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0.vendor \
    vendor.display.config@2.0.vendor:32 \
    vendor.qti.hardware.display \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.allocator@1.0 \
    vendor.qti.hardware.display.allocator@1.0.vendor \
    vendor.qti.hardware.display.allocator@3.0 \
    vendor.qti.hardware.display.allocator@3.0.vendor \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.composer@1.0 \
    vendor.qti.hardware.display.composer@1.0.vendor \
    vendor.qti.hardware.display.composer@2.0 \
    vendor.qti.hardware.display.composer@2.0.vendor \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor

# Dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1-service-lazy

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# FastCharge
PRODUCT_PACKAGES += \
    vendor.lineage.fastcharge@1.0-service.samsung

# Fingerprint
PRODUCT_PACKAGES += \
    vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung-sm8250

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-impl-qti \

# GPS

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1

# HIDL
PRODUCT_PACKAGES += \
    libhwbinder.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# input
PRODUCT_PACKAGES += \
libjni_latinimegoogle

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Keystore
PRODUCT_PACKAGES += \
		android.hardware.keymaster@4.0-service \
    libskeymaster4device \
    libkeymaster4support \
    libkeymaster4_1support \
    libkeymaster4_1support.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0 \
    lights.kona


PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libavservices_minijail_vendor

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:system/etc/libnfc-nci.conf


PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.0 \
    android.hardware.secure_element@1.1 \
    libchrome.vendor \
    libnfc-nci \
    libnfc_nci_jni

# OMX
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service \
    android.hardware.media.c2@1.0 \
    android.hardware.media.c2@1.1 \
    android.hardware.media.bufferpool@2.0 \
    android.hardware.media@1.0 \
    libc2dcolorconvert \
    libcodec2_hidl@1.0.vendor \
    libcodec2_vndk.vendor \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw \
    libstagefright \
    libstagefright_soft_qtiflacdec \
    libstagefright_flacdec \
    libstagefright_soft_qtiflacdec \
    libstagefright_soft_ddpdec  \
    libstagefright_soft_ac4dec  \
    libstagefright_omx_vendor \
    libstagefright_bufferqueue_helper_vendor \
    libsns_fastRPC_util


# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3-service.samsung-sm8250

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare@1.0-service.samsung


# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RIL
PRODUCT_PACKAGES += \
    libsecril-client \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.3 \
    android.hardware.radio@1.4 \
    com.dsi.ant.antradio_library \
    libprotobuf-cpp-full \
    librmnetctl \
    libxml2

# Samsung App
# PRODUCT_PACKAGES += \
#     AdvancedDisplay \
#     SamsungDoze

# Seccomp policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.samsung-sm8250

# Servicetracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.2.vendor


# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-qti.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/broadcast_allowlist.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/broadcast_allowlist.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal

## Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.samsung

# Trust
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service \
    android.hardware.usb@1.2-service-qti \
    android.hardware.usb.gadget@1.0-service-qti

# Vendor libstdc++
PRODUCT_PACKAGES += \
    libstdc++.vendor

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vibrator
PRODUCT_PACKAGES += \
    vibrator.default \
    vendor.qti.hardware.vibrator.service

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    vendor.qti.hardware.wifi.hostapd@1.0.vendor \
    vendor.qti.hardware.wifi.hostapd@1.1.vendor \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.0.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    WifiOverlay \
    wpa_cli \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6390/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# WiFi Display
PRODUCT_PACKAGES += \
    libnl \
    libwfdaac_vendor

# XML
PRODUCT_PACKAGES += \
    libtinyxml2_1

# Consumer IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service.samsung

# Properties
-include $(LOCAL_PATH)/default_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

