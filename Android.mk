#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(filter g12a g12b sm1,$(TARGET_AMLOGIC_SOC)),)

LOCAL_PATH := $(call my-dir)
include $(call all-makefiles-under,$(LOCAL_PATH))

ifneq ($(filter g12b,$(TARGET_AMLOGIC_SOC)),)
GPU_TYPE := gondul_ion
endif
GPU_TYPE ?= dvalin_ion

GPU_LIBRARY_SYMLINK := $(TARGET_OUT_VENDOR)/vendor/lib/egl
$(GPU_LIBRARY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating wifi firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/lib/egl/libGLES_$(GPU_TYPE).so $@/libGLES_mali.so

ALL_DEFAULT_INSTALLED_MODULES += $(GPU_LIBRARY_SYMLINK)

endif
