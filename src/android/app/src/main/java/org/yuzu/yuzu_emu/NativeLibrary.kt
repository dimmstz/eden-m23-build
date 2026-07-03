package org.yuzu.yuzu_emu

object NativeLibrary {
    init {
        System.loadLibrary("yuzu-android")
    }

    // Métodos nativos essenciais mapeados corretamente
    external fun getVulkanDriverVersion(): String
    external fun getVulkanApiVersion(): String
    
    // Força o bypass do driver nativo para carregar o Turnip Customizado
    fun shouldOverrideGraphicsDriver(): Boolean {
        return true
    }
}
