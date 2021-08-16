# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020 The LineageOS Project

LOCAL_PATH := hardware/samsung/hidl/sensors/1.0

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.sensors@1.0-impl.samsung-sm8250
LOCAL_MODULE_TAGS  := optional
LOCAL_VENDOR_MODULE := true

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := \
    Sensors.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libhardware \
    libbase \
    libutils \
    libhidlbase \
    libhidltransport \
    android.hardware.sensors@1.0

LOCAL_STATIC_LIBRARIES := \
    android.hardware.sensors@1.0-convert \
    multihal

include $(BUILD_SHARED_LIBRARY)

