#
# THERMAL DAEMON
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT_SBIN)
LOCAL_MODULE_TAGS := optional


LOCAL_SRC_FILES +=  thermald.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)

LOCAL_STATIC_LIBRARIES := libc libcutils liblog
LOCAL_FORCE_STATIC_EXECUTABLE := true

LOCAL_MODULE := thermald
include $(BUILD_EXECUTABLE)

