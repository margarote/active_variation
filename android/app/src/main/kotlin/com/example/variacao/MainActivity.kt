package com.example.variacao

import android.app.AlertDialog
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

 class MainActivity: FlutterActivity() {

    private  val METHOD_CHANNEL_MESSAGES = "messages"
    private  val METHOD_CHANNEL_SCREENS = "screens"
    private  val CALL_MESSAGE = "message"
    private  val CALL_OPEN_DIALOG = "open_dialog"

    private lateinit var methodChannelMessages: MethodChannel
    private lateinit var methodChannelScreens: MethodChannel



    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        setupChannel(context, flutterEngine.dartExecutor.binaryMessenger)
    }

    private fun setupChannel(context: Context, messager: BinaryMessenger){
        methodChannelMessages = MethodChannel(messager, METHOD_CHANNEL_MESSAGES)
        methodChannelScreens = MethodChannel(messager, METHOD_CHANNEL_SCREENS)

        methodChannelScreens.setMethodCallHandler {
            call, result ->
            if(call.method == CALL_OPEN_DIALOG){
                showDialog()
            }
        }

    }

     private fun showDialog() {
         val alertDialogBuilder = AlertDialog.Builder(this)

         alertDialogBuilder.setPositiveButton("Gráfico") { dialog, which ->
             methodChannelMessages.invokeMethod(CALL_MESSAGE, true)
         }

         alertDialogBuilder.setNegativeButton("Tabela") { dialog, which ->
             methodChannelMessages.invokeMethod(CALL_MESSAGE, false)
         }
         alertDialogBuilder.setTitle("Escolha uma opção")

         alertDialogBuilder.show()
     }
}
