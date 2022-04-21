ARCHS = arm64e arm64

export TARGET = iphone:14.4



# sudo iproxy 2001 22
export iP = localhost
export Port = 2001
export Pass = alpine
export Bundle = com.atebits.Tweetie2 

DEBUG = 0

# THEOS_DEVICE_IP = 192.168.100.4

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SwiftUITweak

SwiftUITweak_FILES = Tweak.xm SWUIFile.swift
SwiftUITweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk


install5::
		install5.exec