# keep me

ifeq ($(LOCAL_MODULE),)
LOCAL_MODULE := $(LOCAL_PACKAGE_NAME)
endif

LOCAL_MODULE_TAGS := optional

LOCAL_BUILT_MODULE := 
LOCAL_INSTALLED_MODULE :=

#######################################
include $(BUILD_SYSTEM)/base_rules.mk
#######################################

$(LOCAL_BUILT_MODULE):
	touch $@