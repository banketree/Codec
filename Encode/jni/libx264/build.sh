#!/bin/sh

#############################################################
#
# 注：
#    此处默认使用 $ANDROID_NDK/platforms/android-16 版本，此
#    版本只支持32位toolchain。
#    如果项目中有使用到 ndk-build 工具，请在 Application.mk 中
#    添加 APP_PLATFORM := android-16
#
#############################################################

cd jni

TOOLCHAINS=/home/banketree

### armeabi-v7a ###
SYSROOT=$TOOLCHAINS/arm/sysroot
CROSS_PREFIX=$TOOLCHAINS/arm/bin/arm-linux-androideabi-
EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon -mthumb -D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7A__ -D__ARM_ARCH_7R__ -D__ARM_ARCH_7M__ -D__ARM_ARCH_7S__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/armeabi-v7a

./configure --prefix=$PREFIX \
        --host=arm-linux-androideabi \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash

make clean
make STRIP= -j8 install || exit 1

