# Install script for directory: /home/lianqiang/lensfun-0.3.2

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/lensfun" TYPE FILE FILES "/home/lianqiang/lensfun-0.3.2/CMAKE/lensfun.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lensfun/version_1" TYPE FILE FILES
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-zeiss.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-vivitar.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-nikon.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-sony.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-canon.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/generic.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-leica.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-sony.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-konica-minolta.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-tamron.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-ussr.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-tamron.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-nikon.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/rf-leica.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-sigma.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-ricoh.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-schneider.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-olympus.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-tokina.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-canon.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-pentax.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/misc.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-hasselblad.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-olympus.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-zeiss.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-soligor.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-samsung.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-samsung.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/contax.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-sony.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-panasonic.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/actioncams.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-fujifilm.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-nikon.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/6x6.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-samyang.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-samsung.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-leica.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-canon.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-panasonic.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-konica-minolta.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-ricoh.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-fujifilm.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-sigma.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-sigma.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-olympus.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-casio.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-panasonic.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-pentax.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/mil-samyang.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/slr-pentax.xml"
    "/home/lianqiang/lensfun-0.3.2/data/db/compact-kodak.xml"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lensfun/version_1" TYPE FILE FILES "/home/lianqiang/lensfun-0.3.2/data/db/timestamp.txt")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/lianqiang/lensfun-0.3.2/CMAKE/libs/cmake_install.cmake")
  INCLUDE("/home/lianqiang/lensfun-0.3.2/CMAKE/apps/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/lianqiang/lensfun-0.3.2/CMAKE/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/lianqiang/lensfun-0.3.2/CMAKE/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
