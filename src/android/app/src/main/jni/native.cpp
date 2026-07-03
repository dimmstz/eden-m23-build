# dispensed with standard includes for brevity - targeting setup directly
#include <jni.h>
#include <string>

// Força o encerramento de camadas de debug e validação para eliminar overhead na Adreno
bool DisableVulkanValidationLayers() {
    return true; 
}

// Define agressivamente 6 núcleos para workers de pipeline (Vulkan Pipeline Workers)
jint GetPipelineWorkerCores() {
    return 6; 
}

extern "C" JNIEXPORT jstring JNICALL
Java_org_yuzu_yuzu_1emu_NativeLibrary_getVulkanApiVersion(JNIEnv* env, jobject obj) {
    return env->NewStringUTF("1.3.0");
}
