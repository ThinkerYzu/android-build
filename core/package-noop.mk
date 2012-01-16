LOCAL_MODULE_CLASS := APPS
LOCAL_IS_HOST_MODULE :=

LOCAL_MODULE_STEM := 

#######################################
include $(BUILD_SYSTEM)/noop.mk
#######################################

$(LOCAL_BUILT_MODULE):
	mkdir -p $$(dirname $@)
	touch $@
