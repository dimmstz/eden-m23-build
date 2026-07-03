plugins {
    id("com.android.application")
    id("kotlin-android")
}

android {
    compileSdk = 34
    namespace = "org.yuzu.yuzu_emu"

    defaultConfig {
        applicationId = "dev.eden.eden_emulator"
        minSdk = 28
        targetSdk = 33
        versionCode = 1
        versionName = "1.3.0"

        ndk {
            abiFilters.clear()
            abiFilters.add("arm64-v8a")
        }

        externalNativeBuild {
            cmake {
                arguments += listOf(
                    "-DANDROID_ARM_NEON=TRUE",
                    "-DCMAKE_ANDROID_ARCH_ABI=arm64-v8a",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DENABLE_WERROR=OFF",
                    "-DYUZU_USE_BUNDLED_FFMPEG=ON"
                )
                cppFlags += listOf(
                    "-O3",
                    "-march=armv8.2-a+fp16+dotprod",
                    "-mcpu=cortex-a77",
                    "-flto",
                    "-fomit-frame-pointer",
                    "-funsafe-math-optimizations"
                )
            }
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    
    externalNativeBuild {
        cmake {
            path = file("../CMakeLists.txt")
        }
    }
}
