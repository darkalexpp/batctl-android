LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := main.c bat-hosts.c functions.c sys.c debug.c ping.c traceroute.c list-batman.c hash.c vis.c debugfs.c bisect.c tcpdump.c 

LOCAL_CFLAGS := -O2 -g -pedantic -Wall -W -std=gnu99 -fno-strict-aliasing -MD

LOCAL_MODULE_TAGS := debug

LOCAL_MODULE := batctl

include $(BUILD_EXECUTABLE)




