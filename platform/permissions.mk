# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



COMMON_PATH := device/samsung/sm8250-common
CONFIG_PATH := $(COMMON_PATH)/config

### PERMISSIONS
# Audio
PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/audio_policy_configuration.xml

#fingerprint
PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# HIDL
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/vendor_override_manifest.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/vintf/manifest/vendor_override_manifest.xml


# NFC
PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

# Power
PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/powerhint.json

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml
