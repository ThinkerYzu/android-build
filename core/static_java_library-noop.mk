LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_IS_HOST_MODULE :=

LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_BUILT_MODULE_STEM := javalib.jar

intermediates.COMMON := $(call local-intermediates-dir,COMMON)
common_javalib.jar := $(intermediates.COMMON)/$(LOCAL_BUILT_MODULE_STEM)
LOCAL_INTERMEDIATE_TARGETS += $(common_javalib.jar)
full_classes_jar := $(intermediates.COMMON)/classes.jar


#######################################
include $(BUILD_SYSTEM)/noop.mk
#######################################

$(full_classes_jar):
	mkdir -p $$(dirname $@)
	touch $@

$(common_javalib.jar): $(full_classes_jar)
	mkdir -p $$(dirname $@)
	touch $@

$(LOCAL_BUILT_MODULE):
	mkdir -p $$(dirname $@)
	touch $@
