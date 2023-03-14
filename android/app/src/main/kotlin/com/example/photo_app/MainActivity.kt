package com.example.photo_app

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == SHARE_MEDIA_METHOD_NAME) {
                val link = call.argument<String>(SHARE_MEDIA_ARG_LINK)
                sendShareIntent(link)
            }
        }
    }

    private fun sendShareIntent(link: String?) {
        val intent = Intent()
        intent.action = Intent.ACTION_SEND
        intent.putExtra(Intent.EXTRA_TEXT, "Hey Check out this great photo $link")
        intent.type = "text/plain"
        startActivity(Intent.createChooser(intent, "Share To:"))
    }

    companion object {
        const val CHANNEL = "com.photoapp.dev/share"
        const val SHARE_MEDIA_METHOD_NAME = "shareMedia"
        const val SHARE_MEDIA_ARG_LINK = "link"
    }
}
