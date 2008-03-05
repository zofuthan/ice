# **********************************************************************
#
# Copyright (c) 2003-2008 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= ..\..\..

TARGETS		= client.exe server.exe
TARGETS_CONFIG	= $(TARGETS:.exe=.exe.config)

C_SRCS		= Client.cs
S_SRCS		= HelloI.cs \
		  Server.cs \
		  WorkQueue.cs

GEN_SRCS	= $(GDIR)\Hello.cs

SDIR		= .

GDIR		= generated

!include $(top_srcdir)\config\Make.rules.mak.cs

MCSFLAGS	= $(MCSFLAGS) -target:exe
SLICE2CSFLAGS	= -I$(slicedir) $(SLICE2CSFLAGS)

client.exe: $(C_SRCS) $(GEN_SRCS)
	$(MCS) $(MCSFLAGS) -out:$@ -r:$(bindir)\Ice.dll $(C_SRCS) $(GEN_SRCS)

server.exe: $(S_SRCS) $(GEN_SRCS)
	$(MCS) $(MCSFLAGS) -out:$@ -r:$(bindir)\Ice.dll $(S_SRCS) $(GEN_SRCS)

!include .depend
