
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

TARGET_NO_RECOVERY := true
