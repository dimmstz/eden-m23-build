#include <jni.h>

// Força o emulador a priorizar o driver de terceiros (Turnip) na Adreno 619
extern "C" JNIEXPORT jboolean JNICALL
Java_org_yuzu_yuzu_1emu_NativeLibrary_shouldForceTurnipDriver(JNIEnv* env, jobject obj) {
    return JNI_TRUE;
}
