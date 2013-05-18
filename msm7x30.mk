#
# Copyright (C) 2011 The CyanogenMod Project
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

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/msm7x30-common/overlay

COMMON_PATH := device/semc/msm7x30-common

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# These are the common hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Common device specific configs
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_PATH)/rootdir/system/etc/init.d/10hostapconf:system/etc/init.d/10hostapconf \
    $(COMMON_PATH)/rootdir/system/etc/init.d/10dhcpcd:system/etc/init.d/10dhcpcd \
    $(COMMON_PATH)/rootdir/system/etc/vold.fstab:system/etc/vold.fstab \
    $(COMMON_PATH)/rootdir/fstab:root/fstab \
    $(COMMON_PATH)/rootdir/fstab.semc:root/fstab.semc \
    $(COMMON_PATH)/rootdir/ueventd.semc.rc:root/ueventd.semc.rc \
    $(COMMON_PATH)/rootdir/sbin/postrecoveryboot.sh:root/sbin/postrecoveryboot.sh

# Offline charging animation & boot logo
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/animations/charging_animation_01_$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).png:system/semc/chargemon/data/charging_animation_01.png \
    $(COMMON_PATH)/animations/charging_animation_02_$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).png:system/semc/chargemon/data/charging_animation_02.png \
    $(COMMON_PATH)/animations/charging_animation_03_$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).png:system/semc/chargemon/data/charging_animation_03.png \
    $(COMMON_PATH)/animations/charging_animation_04_$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).png:system/semc/chargemon/data/charging_animation_04.png \
    $(COMMON_PATH)/animations/charging_animation_05_$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).png:system/semc/chargemon/data/charging_animation_05.png \
    $(COMMON_PATH)/animations/charging_animation_06_$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).png:system/semc/chargemon/data/charging_animation_06.png \
    $(COMMON_PATH)/animations/charging_animation_07_$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).png:system/semc/chargemon/data/charging_animation_07.png \
    $(COMMON_PATH)/bootlogo/$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).rle:root/initlogo.rle

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x30 \
    audio_policy.msm7x30

# Graphics
PRODUCT_PACKAGES += \
    gralloc.msm7x30 \
    copybit.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libtilerenderer \
    libmemalloc \
    liboverlay

# Hal
PRODUCT_PACKAGES += \
    power.semc \
    gps.semc \
    lights.semc \
    camera.semc \
    sensors.default

# QCOM OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libmm-omxcore \
    libdivxdrmdecrypt

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    LegacyCamera \
    Torch

# WiFi
PRODUCT_PACKAGES += \
    libnetcmdiface

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Common device properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d/dev/smd0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.ril.def.agps.mode=2 \
    ro.ril.def.agps.feature=1 \
    ro.telephony.call_ring.multiple=false \
    wifi.supplicant_scan_interval=15 \
    keyguard.no_require_sim=true \
    ro.com.google.locationfeatures=1 \
    ro.product.locale.language=en \
    ro.product.locale.region=US \
    persist.ro.ril.sms_sync_sending=1 \
    ro.use_data_netmgrd=true \
    ro.tethering.kb_disconnect=1 \
    com.qc.hardware=true \
    debug.sf.hw=1 \
    debug.composition.type=gpu \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    debug.mdpcomp.logs=0 \
    BUILD_UTC_DATE=0 \
    persist.sys.usb.config=mtp,adb \
    ro.vold.umsdirtyratio=20 \
    debug.camcorder.disablemeta=1 \
    ro.debuggable=1 \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1

$(call inherit-product-if-exists, vendor/semc/msm7x30-common/msm7x30-common-vendor.mk)
