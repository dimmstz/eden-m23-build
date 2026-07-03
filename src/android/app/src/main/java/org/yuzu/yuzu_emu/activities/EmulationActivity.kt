package org.yuzu.yuzu_emu.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import android.view.WindowManager

class EmulationActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState: Bundle?)
        
        // Força a janela a rodar no modo de performance máxima e 120Hz se disponível
        val params = window.attributes
        params.preferredDisplayModeId = 0 // Permite ao sistema escolher a maior taxa (120Hz)
        window.attributes = params
        
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    }
}
