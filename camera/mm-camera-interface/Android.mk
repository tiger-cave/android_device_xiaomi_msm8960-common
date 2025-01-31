LOCAL_PATH:= $(call my-dir)
LOCAL_DIR_PATH:= $(call my-dir)
include $(CLEAR_VARS)

MM_CAM_FILES:= \
        mm_camera_interface2.c \
        mm_camera_stream.c \
        mm_camera_channel.c \
        mm_camera.c \
        mm_camera_poll_thread.c \
        mm_camera_notify.c \
        mm_camera_sock.c \
        mm_camera_helper.c \
        mm_omx_jpeg_encoder.c

LOCAL_CFLAGS+= -D_ANDROID_

LOCAL_C_INCLUDES+= $(LOCAL_PATH)/..
LOCAL_C_INCLUDES+= $(LOCAL_PATH)/../inc

# Kernel headers
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include/media
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_C_INCLUDES+= hardware/qcom/media/mm-core/inc
LOCAL_CFLAGS += -include bionic/libc/include/sys/socket.h
LOCAL_CFLAGS += -include bionic/libc/include/sys/un.h

LOCAL_SRC_FILES := $(MM_CAM_FILES)

LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE           := libmmcamera_interface2
LOCAL_SHARED_LIBRARIES := libdl libcutils liblog
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := camera_common_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
include $(BUILD_HEADER_LIBRARY)
