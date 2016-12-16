################################################################################
#    This file is part of the MagiCBuild configuration and build system.       #
#                                                                              #
#    Copyright (C) 2003 Marko Grönroos <magi@iki.fi>                           #
#                                                                              #
################################################################################
#                                                                              #
#   This library is free software; you can redistribute it and/or              #
#   modify it under the terms of the GNU Library General Public                #
#   License as published by the Free Software Foundation; either               #
#   version 2 of the License, or (at your option) any later version.           #
#                                                                              #
#   This library is distributed in the hope that it will be useful,            #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of             #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU          #
#   Library General Public License for more details.                           #
#                                                                              #
#   You should have received a copy of the GNU Library General Public          #
#   License along with this library; see the file COPYING.LIB.  If             #
#   not, write to the Free Software Foundation, Inc., 59 Temple Place          #
#   - Suite 330, Boston, MA 02111-1307, USA.                                   #
#                                                                              #
################################################################################

################################################################################
# Define root directory of the source tree
################################################################################
export SRCDIR ?= .

################################################################################
# Package and version info
################################################################################
export packagename = magicbuild
export vermajor    = 0
export verminor    = 1
export verbuild    = 1
export versuffix   = beta

################################################################################
# Extra files and directories
################################################################################
distdirs   =	build docs \
		test test/build \
		test/mymodule test/mymodule/include test/mymodule/src

distfiles  =	README.TXT configure Makefile \
		docs/README-CD.TXT docs/COPYING.LIB \
		docs/magicbuild-usersguide_004.sxw \
		test/Makefile test/runtest \
		test/build/conf-reqs.sh \
		test/mymodule/mymodule.mk test/mymodule/include/myheader.h \
		test/mymodule/src/mymain.cc test/mymodule/src/mysource.cc

buildfiles =	magicdef.mk magiccmp.mk magicdist.mk magictop.mk magicver.mk \
		install-magicbuild toDox.pl makefile.template

################################################################################
# Include build framework
################################################################################
include $(SRCDIR)/build/magicdef.mk

# Recursively call sub-makes for following modules
makemodules = 

################################################################################
# Include build rules
################################################################################
include $(SRCDIR)/build/magictop.mk

################################################################################
# Build distribution CD
################################################################################
media: dist mk_media_dir copy_media

# Definitions
mediadir        = $(outputdir)/media
mediapackagedir = $(mediadir)/$(packagename)
version         = $(vermajor).$(verminor).$(verbuild)$(versuffix)

# Build directory structure
mk_media_dir:
	rm -rf $(mediapackagedir)
	mkdir -p $(mediapackagedir)
	mkdir -p $(mediapackagedir)/sources
	mkdir -p $(mediapackagedir)/docs
	mkdir -p $(mediapackagedir)/dist

copy_media: copy_readme copy_sources
	cp docs/magicbuild-usersguide.pdf $(mediapackagedir)/docs/magicbuild-usersguide-$(version).pdf

copy_readme:
	cp docs/README-CD.TXT $(mediapackagedir)/README.TXT
	cp docs/COPYING.LIB $(mediapackagedir)/COPYING.LIB

copy_sources:
	cp $(distdir)/$(packagefilename) $(mediapackagedir)/dist/$(packagefilename)
	cd $(mediapackagedir)/sources ; tar jxf $(mediapackagedir)/dist/$(packagefilename)
	mv $(mediapackagedir)/sources/$(fullpackagename)/* $(mediapackagedir)/sources
	rmdir $(mediapackagedir)/sources/$(fullpackagename)
