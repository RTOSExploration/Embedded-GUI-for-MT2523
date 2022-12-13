#!/usr/bin/env bash

compile() {
  DB=$RTOSExploration/bitcode-db/Embedded-GUI-for-MT2523/$(dirname $1 | sed 's_.*project/__')
  [ -d "$DB" ] && echo "Directory $DB exists" && return 0
  mkdir -p $DB

  export WLLVM_OUTPUT_LEVEL=INFO \
         LLVM_COMPILER=hybrid \
         LLVM_COMPILER_PATH=/usr/lib/llvm-14/bin \
         BINUTILS_TARGET_PREFIX=arm-none-eabi

  cd $1
  #rm -rf $DB && make clean
  make clean
  make -j$(nproc) CC=wllvm
  for elf in `find . \( -name "*.out" -o -name "*.elf" \) ! -name "a.out" -executable`; do
    echo ELF file $elf
    extract-bc $elf && $LLVM_COMPILER_PATH/llvm-dis $elf.bc && \
      cp --backup=numbered $elf.bc $elf.ll $DB
    done
}

for srcdir in $(find $PWD/project | grep '/GCC$' | grep -v 'build'); do
#for srcdir in project/mt2523_hdk/apps/gdi_display_helloworld/GCC; do
  echo $srcdir
  compile "$srcdir"
done
