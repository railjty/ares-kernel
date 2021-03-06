
export ANDROID_MAJOR_VERSION=s
make O=out ARCH=arm64 ares_defconfig
#make O=out ARCH=arm64 aresin_defconfig
#make O=out ARCH=arm64 menuconfig

#cp -r /media/jty/AEX/hamjin-config ./out/.config
#cp -r /media/jty/AEX/hamjin-config ./out/.config.old
PATH="/media/jty/clang/clang-r437112b/bin:/media/jty/gcc-arm64-4.9/bin:/media/jty/Desktop/gcc-arm-4.9/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      LD=ld.lld \
                      LD_LIBRARY_PATH=/media/jty/clang/clang-r437112b/lib64:$LD_LIBRARY_PATH \
                      NM=llvm-nm \
		      OBJCOPY=llvm-objcopy \
		      CLANG_PREBUILT_BIN=/media/jty/clang/clang-r437112b/bin \
		      LINUX_GCC_CROSS_COMPILE_PREBUILTS_BIN=/media/jty/clang/clang-r437112b/bin:/media/jty/gcc-arm64-4.9/bin \
                      CROSS_COMPILE=aarch64-linux-androidkernel-  \
                      CROSS_COMPILE_ARM32=arm-linux-androidkernel- \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      2>&1 | tee error.log

