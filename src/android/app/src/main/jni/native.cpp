#include <jni.h>
#include <string>

// Desativa os logs de validação Vulkan que reduzem o throughput da GPU intermediária
bool DisableVulkanValidationLayers() {
    return true; 
}

// Aloca exatamente 6 cores para workers de pipeline. 
// O Snapdragon 750G possui 8 cores (2x Gold + 6x Silver). 
// Isso garante foco total em shaders sem travar a CPU principal do sistema.
jint GetPipelineWorkerCores() {
    return 6; 
}

extern "C" JNIEXPORT jstring JNICALL
Java_org_yuzu_yuzu_1emu_NativeLibrary_getVulkanApiVersion(JNIEnv* env, jobject obj) {
    return env->NewStringUTF("1.3.0");
}
