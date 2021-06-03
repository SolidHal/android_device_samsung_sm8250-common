LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_RAMDISK_OUT)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE       := init.recovery.qcom.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE       := init.qcom.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)

include $(BUILD_PREBUILT)


# skip_mount.cfg, read by init to skip mounting some partitions when GSI is used.
# include $(CLEAR_VARS)
# LOCAL_MODULE := skip_mount.cfg
# LOCAL_SRC_FILES := $(LOCAL_MODULE)
# LOCAL_MODULE_CLASS := ETC
# LOCAL_SYSTEM_EXT_MODULE := true
# LOCAL_MODULE_RELATIVE_PATH := init/config

# include $(BUILD_PREBUILT)
