SRCPATH=.
prefix=/home/banketree/Tree/libx264-android-master/jni/../libs/armeabi-v7a
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
SYS_ARCH=ARM
SYS=LINUX
CC=/home/banketree/arm/bin/arm-linux-androideabi-gcc
CFLAGS=-O3 -ffast-math  -Wall -I. -I$(SRCPATH) --sysroot=/home/banketree/arm/sysroot -march=armv7-a -mfloat-abi=softfp -mfpu=neon -mthumb -D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7A__ -D__ARM_ARCH_7R__ -D__ARM_ARCH_7M__ -D__ARM_ARCH_7S__ -std=gnu99 -D_GNU_SOURCE -fPIC -fomit-frame-pointer
COMPILER=GNU
COMPILER_STYLE=GNU
DEPMM=-MM -g0
DEPMT=-MT
LD=/home/banketree/arm/bin/arm-linux-androideabi-gcc -o 
LDFLAGS= --sysroot=/home/banketree/arm/sysroot -nostdlib -lm -lpthread -s -ldl
LIBX264=libx264.a
AR=/home/banketree/arm/bin/arm-linux-androideabi-ar rc 
RANLIB=/home/banketree/arm/bin/arm-linux-androideabi-ranlib
STRIP=/home/banketree/arm/bin/arm-linux-androideabi-strip
INSTALL=install
AS=/home/banketree/arm/bin/arm-linux-androideabi-gcc
ASFLAGS= -I. -I$(SRCPATH) -c -DSTACK_ALIGNMENT=4 -DPIC -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8
RC=
RCFLAGS=
EXE=
HAVE_GETOPT_LONG=1
DEVNULL=/dev/null
PROF_GEN_CC=-fprofile-generate
PROF_GEN_LD=-fprofile-generate
PROF_USE_CC=-fprofile-use
PROF_USE_LD=-fprofile-use
HAVE_OPENCL=yes
default: lib-static
install: install-lib-static
LDFLAGSCLI = 
CLI_LIBX264 = $(LIBX264)
