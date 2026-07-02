#!/data/data/com.termux/files/usr/bin/bash

cd ~/eden_build/eden || exit 1

echo "=== EDEN V5 EXTREME M23 ==="

####################################
# NativeLibrary.kt
####################################

NATIVE="./src/android/app/src/main/java/org/yuzu/yuzu_emu/NativeLibrary.kt"

if [ -f "$NATIVE" ]; then
  cp "$NATIVE" "$NATIVE.bak"

  # força Vulkan se existir enum/config
  sed -i 's/AUTO/VULKAN/g' "$NATIVE" 2>/dev/null

  # cache shader maior
  sed -i 's/128/512/g' "$NATIVE" 2>/dev/null

  echo "[OK] NativeLibrary extreme patch"
fi

####################################
# EmulationActivity.kt
####################################

EMU="./src/android/app/src/main/java/org/yuzu/yuzu_emu/activities/EmulationActivity.kt"

if [ -f "$EMU" ]; then
  cp "$EMU" "$EMU.bak"

  # fps unlock
  sed -i 's/60/120/g' "$EMU" 2>/dev/null

  echo "[OK] EmulationActivity fps patch"
fi

####################################
# libadrenotools report
####################################

ADRENO="./.patch/libadrenotools"

if [ -d "$ADRENO" ]; then
  find "$ADRENO" > adreno_files.txt

  # localizar configs de driver
  grep -R "driver" "$ADRENO" > adreno_driver_scan.txt 2>/dev/null
  grep -R "override" "$ADRENO" >> adreno_driver_scan.txt 2>/dev/null

  echo "[OK] AdrenoTools scanned"
fi

####################################
# procurar configs vulkan
####################################

grep -R "Vulkan" ./src/android > vulkan_scan.txt 2>/dev/null
grep -R "Renderer" ./src/android >> vulkan_scan.txt 2>/dev/null

####################################
# compile flags
####################################

CMAKE=$(find . -name "CMakeLists.txt" | head -1)

if [ -f "$CMAKE" ]; then
cat >> "$CMAKE" <<EOF

# M23 EXTREME FLAGS
set(CMAKE_C_FLAGS "\${CMAKE_C_FLAGS} -Ofast")
set(CMAKE_CXX_FLAGS "\${CMAKE_CXX_FLAGS} -Ofast -march=armv8-a")
EOF
echo "[OK] CMake turbo"
fi

echo ""
echo "==== CONCLUIDO ===="
echo "Arquivos gerados:"
echo "adreno_driver_scan.txt"
echo "vulkan_scan.txt"
