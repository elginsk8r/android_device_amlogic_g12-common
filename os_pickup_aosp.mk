# This file guards most of hardware/qcom/* from
# being used on devices which use hardware/qcom-caf/*

# Legacy CAF devices still want AOSP keymaster HAL.
LEGACY_MODULE_DIRS := legacy/mali legacy/media optee
MODULE_DIRS := mali media optee
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_USES_LEGACY_AMLOGIC_MODULES),true)
# convert CAF_DIRS to something we can give to filter
filter_LEGACY_MODULE_DIRS := $(foreach dir,$(LEGACY_MODULE_DIRS),%/$(dir)/Android.mk)
include $(filter,$(filter_LEGACY_MODULE_DIRS),$(call first-makefiles-under,$(LOCAL_PATH)))
else
filter_MODULE_DIRS := $(foreach dir,$(MODULE_DIRS),%/$(dir)/Android.mk)
include $(filter,$(filter_MODULE_DIRS),$(call first-makefiles-under,$(LOCAL_PATH)))
endif
