================================================================================
=    MagiCBuild distribution CD contents                                       =
=                                                                              =
=    This file is part of the MagiCBuild configuration and build system.       =
=                                                                              =
=    Copyright (C) 2003 Marko Grönroos <magi@iki.fi>                           =
================================================================================

============
Introduction
============

MagiCBuild is a build system that provides high-level functionality
for compiling a software product from source code. It is based on GNU
Make and consists of a framework of makefiles.

This document describes the contents of the distribution CD.

===========
CD Contents
===========

  - README.TXT: This file
  - dist:       Source distribution package
  - docs:       MagiCBuild User's Guide
  - sources:    Source files

-------------------
Full directory tree
-------------------

|-- dist
|   `-- magicbuild-0.1.1beta.src.tar.bz2
|-- docs
|   `-- magicbuild-usersguide-0.1.1beta.pdf
`-- sources
    |-- Makefile
    |-- README.TXT
    |-- build
    |   |-- install-magicbuild
    |   |-- magiccmp.mk
    |   |-- magicdef.mk
    |   |-- magicdist.mk
    |   |-- magictop.mk
    |   |-- magicver.mk
    |   |-- makefile.template
    |   `-- toDox.pl
    |-- configure
    |-- docs
    |   `-- magicbuild-usersguide_004.sxw
    `-- test
        |-- Makefile
        |-- build
        |   `-- conf-reqs.sh
        |-- mymodule
        |   |-- include
        |   |   `-- myheader.h
        |   |-- mymodule.mk
        |   `-- src
        |       |-- mymain.cc
        |       `-- mysource.cc
        `-- runtest

===========
End of File
===========
