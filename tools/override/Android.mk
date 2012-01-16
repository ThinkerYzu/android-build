ifdef XXXXX
include $(CLEAR_VARS)

LOCAL_MODULE := gonk-override-host-java
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
	droiddoc \
	clearsilver \
	libclearsilver-jni \
	layoutlib_create

include $(BUILD_HOST_JAVA_LIBRARY)



include $(CLEAR_VARS)

LOCAL_MODULE := gonk-override-java
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := temp_layoutlib

include $(BUILD_JAVA_LIBRARY)



include $(CLEAR_VARS)

LOCAL_MODULE:= gonk-override-share
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_SUFFIX := $(HOST_JNILIB_SUFFIX)
LOCAL_OVERRIDES_PACKAGES := libclearsilver-jni

include $(BUILD_HOST_SHARED_LIBRARY)

endif
