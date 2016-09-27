LOCAL_PATH := $(call my-dir)
LOCAL_LIB	:=lib

############# prebuilt ###############
include $(CLEAR_VARS)
LOCAL_MODULE := libx264
LOCAL_SRC_FILES := $(LOCAL_LIB)/libx264.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libyuv
LOCAL_SRC_FILES := $(LOCAL_LIB)/libyuv.a
include $(PREBUILT_STATIC_LIBRARY)

############# build libenc ###########
include $(CLEAR_VARS)

LOCAL_MODULE := libencode
LOCAL_SRC_FILES := libencode.cc
LOCAL_CFLAGS    :=
LOCAL_LDLIBS    := -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libx264
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libyuv
LOCAL_STATIC_LIBRARIES := libx264 libyuv
LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
include $(BUILD_SHARED_LIBRARY)
