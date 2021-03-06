########################################################################
#
# This file is provided under a dual BSD/GPLv2 license.  When using or
# redistributing this file, you may do so under either license.
#
# GPL LICENSE SUMMARY
#
# Copyright(c) 2011 Intel Corporation. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
# The full GNU General Public License is included in this distribution
# in the file called LICENSE.GPL.
#
# Contact Information:
# Intel Corporation
# 2200 Mission College Blvd.
# Santa Clara, CA  97052
#
# BSD LICENSE
#
# Copyright(c) 2011 Intel Corporation. All rights reserved.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the
#     distribution.
#   * Neither the name of Intel Corporation nor the names of its
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
########################################################################

TARGET = otm_hdmi

OTM_HDMI_TOP = .
OTM_HDMI_INCDIR = $(srctree)/$(src)/$(OTM_HDMI_TOP)

MEDIA_INCDIR=drivers/staging/intel_media

ifeq ($(filter y, $(CONFIG_DRM_MDFLD) $(CONFIG_DRM_CTP)), y)
INCDIR=drivers/staging/mrst
GFX_INCDIR=drivers/staging/mrst/pvr
else ifeq ($(CONFIG_DRM_MRFLD),y)
INCDIR=drivers/staging/mrfl
GFX_INCDIR=drivers/staging/mrfl/rgx
include_dirs := \
	-I$(INCDIR)/interface \
	-I$(INCDIR)/rgx/include \
	-I$(MEDIA_INCDIR)/bc_video
endif

include_dirs += \
	$(PVRINCS-y) \
	-I$(INCDIR)/drv \
	-I$(MEDIA_INCDIR)/common \
	-I$(MEDIA_INCDIR)/video/common \
	-Iinclude/linux \
	-Iinclude/drm

include $(MEDIA_INCDIR)/build/pvrdefs.mk

ccflags-y += $(PVRDEFS-y)
ccflags-y += $(include_dirs)
#ccflags-y += $(ANDROID_TOOLCHAIN_FLAGS)

ccflags-y += \
	-I$(OTM_HDMI_INCDIR)/os/android/include \
	-I$(OTM_HDMI_INCDIR)/pil/include \
	-I$(OTM_HDMI_INCDIR)/pil/common \
	-I$(OTM_HDMI_INCDIR)/pil/specific/include \
	-I$(OTM_HDMI_INCDIR)/ipil/include \
	-I$(OTM_HDMI_INCDIR)/ipil/common \
	-I$(OTM_HDMI_INCDIR)/ipil/specific/include \

# This flag should always be kept ON
ccflags-y += -Werror

#uncomment for debug prints
#ccflags-y += -DDEBUG

#only for internal testing
ccflags-y += -DOTM_HDMI_UNIT_TEST

#enable HDCP
ccflags-y += -DOTM_HDMI_HDCP_ENABLE
#ccflags-y += -DOTM_HDMI_HDCP_ALWAYS_ENC

ifeq ($(CONFIG_DRM_CTP),y)
ccflags-y += \
	-I$(OTM_HDMI_INCDIR)/pil/specific/ctp \
	-I$(OTM_HDMI_INCDIR)/ipil/specific/mfld
else ifeq ($(CONFIG_DRM_MDFLD),y)
ccflags-y += \
	-I$(OTM_HDMI_INCDIR)/pil/specific/mfld \
	-I$(OTM_HDMI_INCDIR)/ipil/specific/mfld
else ifeq ($(CONFIG_DRM_MRFLD),y)
ccflags-y += \
	-I$(OTM_HDMI_INCDIR)/pil/specific/mrfld \
	-I$(OTM_HDMI_INCDIR)/ipil/specific/mfld
endif

# Platform independent library
$(TARGET)-y += \
	$(OTM_HDMI_TOP)/pil/common/otm_hdmi.o \
	$(OTM_HDMI_TOP)/pil/common/mode_info.o \
	$(OTM_HDMI_TOP)/pil/common/hdcp.o \
	$(OTM_HDMI_TOP)/pil/common/edid.o \
	$(OTM_HDMI_TOP)/pil/common/edid_print.o \
	$(OTM_HDMI_TOP)/pil/common/infoframes.o

# IP independent library
$(TARGET)-y += \
	$(OTM_HDMI_TOP)/ipil/common/otm_ipil_main.o \
	$(OTM_HDMI_TOP)/ipil/common/ipil_hdcp.o

# OS specific library
$(TARGET)-y += \
	$(OTM_HDMI_TOP)/os/android/android_hdmi.o

ifeq ($(CONFIG_DRM_CTP),y)
$(TARGET)-y += \
	$(OTM_HDMI_TOP)/ipil/specific/mfld/ips_hdmi.o \
	$(OTM_HDMI_TOP)/ipil/specific/mfld/ips_hdcp.o \
	$(OTM_HDMI_TOP)/ipil/specific/ctp/ips_hdmi_priv.o \
	$(OTM_HDMI_TOP)/pil/specific/ctp/ps_tw_hdmi.o
else ifeq ($(CONFIG_DRM_MDFLD),y)
$(TARGET)-y += \
	$(OTM_HDMI_TOP)/ipil/specific/mfld/ips_hdmi.o \
	$(OTM_HDMI_TOP)/ipil/specific/mfld/ips_hdcp.o \
	$(OTM_HDMI_TOP)/ipil/specific/mfld/ips_hdmi_priv.o \
	$(OTM_HDMI_TOP)/pil/specific/mfld/ps_hdmi.o
else ifeq ($(CONFIG_DRM_MRFLD),y)
$(TARGET)-y += \
	$(OTM_HDMI_TOP)/ipil/specific/mfld/ips_hdmi.o \
	$(OTM_HDMI_TOP)/ipil/specific/mrfld/ips_hdcp.o \
	$(OTM_HDMI_TOP)/ipil/specific/mrfld/ips_hdmi_priv.o \
	$(OTM_HDMI_TOP)/pil/specific/mrfld/ps_hdmi.o
endif

obj-$(CONFIG_SUPPORT_HDMI) += $(TARGET).o
