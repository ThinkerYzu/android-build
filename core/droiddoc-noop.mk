LOCAL_IS_HOST_MODULE := $(call true-or-empty,$(LOCAL_IS_HOST_MODULE))

#######################################
# include $(BUILD_SYSTEM)/noop.mk
#######################################

.PHONY: $(LOCAL_MODULE)-docs
$(LOCAL_MODULE)-docs :
