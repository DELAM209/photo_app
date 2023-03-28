package com.example.photo_app

import android.content.BroadcastReceiver
import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private var startString: String? = null
    private var linksReceiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == SHARE_MEDIA_METHOD_NAME) {
                val link = call.argument<String>(SHARE_MEDIA_ARG_LINK)
                sendShareIntent(link)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        startString = intent.data?.toString()
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (intent.action == Intent.ACTION_VIEW) {
            linksReceiver?.onReceive(this.application, intent)
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
