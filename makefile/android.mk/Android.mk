LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_LDLIBS := -L./libs -ldl -llog -lm

LOCAL_MODULE    := CSSTelegram
LOCAL_SRC_FILES :=	dcs_css_comm_PacketTool.cpp \
                        JNITool.cpp \
                        src/crypto/aes.cpp \
                        src/crypto/SMS4.cpp \
                        src/clientPacket.cpp \
                        src/clientTool.cpp \
                        src/clientUtility.cpp \
                        src/manageClientPacket.cpp \
                        src/mutility.cpp \
                        src/packet.cpp \
                        src/release.cpp \
                        src/tlvlength.cpp \
                        src/tutility.cpp \
                        src/utility.cpp

LOCAL_C_INCLUDES  += ./

#reference external libs here
LOCAL_SHARED_LIBRARIES := liblog libcutils 

include $(BUILD_SHARED_LIBRARY)