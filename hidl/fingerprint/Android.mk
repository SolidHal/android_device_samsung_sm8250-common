# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020 The LineageOS Project

include $(call all-subdir-makefiles)

LOCAL_PATH := hardware/samsung/hidl/fingerprint

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.biometrics.fingerprint@2.1-service.samsung-sm8250
LOCAL_MODULE_TAGS  := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_EXECUTABLES)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_STEM := android.hardware.biometrics.fingerprint@2.1-service.samsung

LOCAL_SRC_FILES := \
    BiometricsFingerprint.cpp \
    service.cpp

LOCAL_REQUIRED_MODULES := \
    android.hardware.biometrics.fingerprint@2.1-service.samsung.rc

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libhardware \
    libhidlbase \
    libhidltransport \
    liblog \
    libutils \
    android.hardware.biometrics.fingerprint@2.1

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.biometrics.fingerprint@2.1-service.samsung.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)/init
LOCAL_MODULE_STEM := vendor.samsung.hardware.biometrics.fingerprint@3.0-service.rc

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)
