#!/data/data/com.termux/files/usr/bin/bash

cd ~/eden_build/eden || exit 1

echo "=== EDEN V4 FAST PATCH ==="

# 1 NativeLibrary
NATIVE=$(find . -name "NativeLibrary.kt" | head -1)

if [ -f "$NATIVE" ]; then
  sed -i 's/Renderer.AUTO/Renderer.VULKAN/g' "$NATIVE" 2>/dev/null
  sed -i 's/cache_size *= *128/cache_size = 512/g' "$NATIVE" 2>/dev/null
fi

# 2 EmulationActivity
EMU=$(find . -name "EmulationActivity.kt" | head -1)

if [ -f "$EMU" ]; then
  sed -i 's/fpsLimit *= *60/fpsLimit = 120/g' "$EMU" 2>/dev/null
  sed -i 's/maxFps *= *60/maxFps = 120/g' "$EMU" 2>/dev/null
fi

# 3 somente android source (não projeto inteiro)
find ./src/android -type f -name "*.kt" \
-exec sed -i '/Log.d(/d' {} \; 2>/dev/null

# 4 adrenotools scan
find . -iname "*adrenotools*" > adreno_report.txt 2>/dev/null

# 5 shader cache scan
find . -iname "*shader*" > shader_report.txt 2>/dev/null

echo ""
echo "FINALIZADO"
echo "Arquivos:"
echo "adreno_report.txt"
echo "shader_report.txt"
