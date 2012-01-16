#BUILD_DROIDDOC:= $(BUILD_SYSTEM)/droiddoc-noop.mk

############################################################
#subdir_makefiles := \
#	$(shell build/tools/findleaves.py --prune=out --prune=.repo --prune=.git $(subdirs) Android.mk)
#
#include $(subdir_makefiles)
############################################################

NO_USER_MODULES := out/host/linux-x86/framework/temp_layoutlib.jar
ALL_MODULE_TAGS.user := \
	$(filter-out $(NO_USER_MODULES), $(ALL_MODULE_TAGS.user))

NO_CHECKED_MODULES := \
	out/host/common/obj/JAVA_LIBRARIES/clearsilver_intermediates/javalib.jar \
	out/host/common/obj/JAVA_LIBRARIES/layoutlib_create_intermediates/javalib.jar \
	out/host/common/obj/JAVA_LIBRARIES/temp_layoutlib_intermediates/javalib.jar \
	out/host/linux-x86/framework/temp_layoutlib.jar \
	out/host/linux-x86/obj/lib/libclearsilver-jni.so

$(foreach mod, $(ALL_MODULES), \
	$(eval ALL_MODULES.$(mod).CHECKED := \
		$(filter-out $(NO_CHECKED_MODULES), \
			$(ALL_MODULES.$(mod).CHECKED))))

$(foreach mod, $(ALL_MODULES), \
	$(eval ALL_MODULES.$(mod).BUILT := \
		$(filter-out $(NO_CHECKED_MODULES), \
			$(ALL_MODULES.$(mod).BUILT))))

REMOVE_CLASSES := APPS JAVA_LIBRARIES

define remove-module
$(foreach t,$(ALL_MODULES.$(1).TAGS),
ALL_MODULE_TAGS.$(t) := $(filter-out $(ALL_MODULES.$(1).INSTALLED), \
			$(ALL_MODULE_TAGS.$(t))))
ALL_MODULES.$(1).TAGS :=
ALL_MODULES.$(1).CHECKED :=
ALL_MODULES.$(1).BUILT :=
endef

$(foreach m, $(ALL_MODULES), \
	$(if $(filter $(REMOVE_CLASSES), $(ALL_MODULES.$(m).CLASS)), \
		$(eval $(call remove-module,$(m)))))

TARGET_NO_RECOVERY := true
