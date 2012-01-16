LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE_SUFFIX := $(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_IS_HOST_MODULE := true
LOCAL_BUILT_MODULE_STEM := javalib.jar

ifeq ($(LOCAL_BUILD_HOST_DEX),true)
intermediates := $(call local-intermediates-dir)
intermediates.COMMON := $(call local-intermediates-dir,COMMON)

full_classes_jar := $(intermediates.COMMON)/classes.jar
built_dex := $(intermediates.COMMON)/classes.dex

LOCAL_INTERMEDIATE_TARGETS += \
    $(full_classes_jar) \
    $(built_dex)

LOCAL_INTERMEDIATE_SOURCE_DIR := $(intermediates.COMMON)/src
endif # LOCAL_BUILD_HOST_DEX


#######################################
include $(BUILD_SYSTEM)/noop.mk
#######################################


ifeq ($(LOCAL_BUILD_HOST_DEX),true)
$(full_classes_jar):
	mkdir -p $$(dirname $@)
	touch $@

$(built_dex):
	mkdir -p $$(dirname $@)
	touch $@

$(LOCAL_BUILT_MODULE):
	mkdir -p $$(dirname $@)
	touch $@

else
$(LOCAL_BUILT_MODULE):
	mkdir -p $$(dirname $@)
	touch $@
endif  # LOCAL_BUILD_HOST_DEX
