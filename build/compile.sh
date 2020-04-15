#!/bin/bash

# Defaults
args=("$@")
file="${args[$#-1]}"
arch="64"
import=true
run=false
cleanup=false
xxd=false
strace=false

function usage() {
  echo """
    Simple assembler and linker automation
    Usage:
      -h help This help
      -a <arch> Specify the architecture default: x86_64
      -i <yes|no> Enable dynamic linking and libc import (Default: yes)
      -r run Run the program after building it
      -c cleanup Delete the .o and binary afterwards
      -x xxd Run the output through xxd when running it
      -s strace Run the program with strace
  """
  exit 0
}

while getopts "hrcxsa:i:" OPTIONS; do
  case ${OPTIONS} in
    h) usage;;
    a) arch="$OPTARG";;
    r) run=true;;
    i) if [[ "$OPTARG" == "yes" ]]; then
            import=true
       else
            import=false
       fi;;
    c) cleanup=true;;
    x) xxd=true;;
    s) strace=true;;
  esac
done

echo "[*] Architecure: $arch"
echo "[*] Input file : $file"
base=$(echo $file | cut -d\. -f1)
#echo "[*] Basename : $base"

echo "[*] Assembling ..."
as $file --$arch -o $base.o
if [[ $? -eq 0 ]]; then 
  echo "✅ Assembly done : $base.o"
else
  echo "❌ Assembly FAILURE"
  exit 1
fi

echo "[*] Linking ..."
if $import; then
    echo "[*] Dynamic linking with libc..."
    ld -dynamic-linker /lib/ld-musl-x86_64.so.1 -lc -A elf_x86_$arch $base.o -e main -o $base
else
    ld -A elf_x86_$arch $base.o -e main -o $base
fi
if [[ $? -eq 0 ]]; then 
  echo "✅ Linking done : $base ($(stat -c %s $base) bytes)"
else
  echo "❌ Linking FAILURE"
  exit 1
fi

if $run; then
  if $strace; then
    base="strace ./$base"
  else
    base="./$base"
  fi
  echo "[*] Running $base ..."
  echo "--------"
  if $xxd; then
    $base | xxd
  else
    $base
  fi 
  echo "--------| ret: $?"
fi

if $cleanup; then
  echo "[*] Cleaning up : $base.o $base"
  rm -f $base $base.o
fi
