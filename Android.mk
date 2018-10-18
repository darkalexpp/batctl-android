###############################################################################
# Makefile for wireless-tools using Android NDK
#
# Taken verbatim from:
# http://code.google.com/p/haggle/wiki/WirelessTools
#
# Copyright 2011, Eric Nordstrom and others
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
###############################################################################

LOCAL_PATH:= $(call my-dir)
APP_PIE := true
APP_ALLOW_MISSING_DEPS=true 
##APP_STL := c++_static

MY_CFLAGS := -pedantic -fno-strict-aliasing -Wvariadic-macros -MMD -fPIE -std=gnu99
MY_LDFLAGS := -fPIE -pie
MY_STATIC_LIBS	:= libC

################## build lib ###################
include $(CLEAR_VARS)
LOCAL_SRC_FILES := Getline.c ether_aton.c ether_aton_r.c ether_ntoa.c ether_ntoa_r.c 
#dprintf.c
LOCAL_MODULE:= libC
LOCAL_CFLAGS 		+= -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Winline -MMD -fPIE
LOCAL_STATIC_LIBRARIES  := libcutils libc libm libz 
include $(BUILD_STATIC_LIBRARY)


################## build batctl ###################
include $(CLEAR_VARS)
LOCAL_MODULE		:= batctl
LOCAL_SRC_FILES 	:= main.c bat-hosts.c functions.c sys.c debug.c ping.c traceroute.c list-batman.c hash.c tcpdump.c vis.c debugfs.c bisect.c
LOCAL_CFLAGS 		+= $(MY_CFLAGS)
LOCAL_LDFLAGS 		+= $(MY_LDFLAGS)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_LDLIBS    += -lm
include $(BUILD_EXECUTABLE)




