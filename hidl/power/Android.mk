# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020 The LineageOS Project

LOCAL_PATH := hardware/samsung/hidl/power-libperfmgr

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power@1.3-service.samsung-sm8250
LOCAL_MODULE_STEM := android.hardware.power@1.3-service.samsung-libperfmgr
LOCAL_MODULE_TAGS  := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_EXECUTABLES)
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := \
    service.cpp \
    Power.cpp \
    InteractionHandler.cpp

LOCAL_REQUIRED_MODULES := \
    android.hardware.power@1.3-service.samsung-libperfmgr.rc \
    android.hardware.power@1.3-service.samsung.xml

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libhidlbase \
    libhidltransport \
    liblog \
    libutils \
    libcutils \
    libperfmgr \
    android.hardware.power@1.0 \
    android.hardware.power@1.1 \
    android.hardware.power@1.2 \
    android.hardware.power@1.3

LOCAL_STATIC_LIBRARIES := \
    vendor.lineage.power@1.0

LOCAL_CFLAGS += -Wall -Werror

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power@1.3-service.samsung-libperfmgr.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)/init
LOCAL_MODULE_STEM := android.hardware.power@1.0-service.rc

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power@1.3-service.samsung.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)/vintf/manifest

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)
