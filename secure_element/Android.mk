LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.secure_element@1.1-service-sm8250
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
PACKAGES.$(LOCAL_MODULE).OVERRIDES := android.hardware.secure_element@1.1-service
LOCAL_SRC_FILES := ../../../../vendor/samsung/sm8250-common/proprietary/vendor/bin/hw/android.hardware.secure_element@1.1-service
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)/hw
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.secure_element@1.1-service-sm8250.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
PACKAGES.$(LOCAL_MODULE).OVERRIDES := android.hardware.secure_element@1.1-service
LOCAL_SRC_FILES := android.hardware.secure_element@1.1-service.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init
include $(BUILD_PREBUILT)



include $(CLEAR_VARS)
LOCAL_MODULE := ese_spi_nxp-sm8250
LOCAL_MODULE_FILENAME := ese_spi_nxp.so
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
PACKAGES.$(LOCAL_MODULE).OVERRIDES := ese_spi_nxp
LOCAL_SRC_FILES := ../../../../vendor/samsung/sm8250-common/proprietary/vendor/lib64/ese_spi_nxp.so
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR)/lib64
include $(BUILD_PREBUILT)
