package com.bsni.nameq.v2.view.menu

import android.app.Dialog
import android.content.DialogInterface
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.util.Base64
import android.view.View
import android.webkit.*
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AppCompatActivity
import com.bsni.nameq.R
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.dialogs.ConfirmDialog
import com.bsni.nameq.v2.util.common.logD
import kotlinx.android.synthetic.main.activity_promotion_edit.*
import kotlinx.android.synthetic.main.top_layout.*
import java.net.URLEncoder

class PromotionEditActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_promotion_edit)
        init()
        initListener()
    }

    fun init(){
        val url="http://bizq.kr/app/promotion/register.php?muid="
        tvTitle.text="MY 홍보 수정"
        logD(GlobalApplication.account.values.muid.toString())
        val muid=GlobalApplication.account.values.muid.toString()
        var encoded = Base64.encodeToString(muid.toByteArray(), Base64.NO_WRAP)
        encoded = URLEncoder.encode(encoded, "UTF-8")

        val client = object :WebViewClient(){
            @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
            override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest): Boolean {

                if (!(url+encoded).equals(request.url)){
                    setResult(RESULT_OK)
                    finish()
                }
                return true
            }

            override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
//                LogUtil.d("shouldOverrideUrlLoading1", "shouldOverrideUrlLoading url : %s", url)
                return true
            }
        }

        val chromeClient = object : WebChromeClient() {
            override fun onJsAlert(view: WebView, url: String?, message: String?, result: JsResult): Boolean {
                val dialog = ConfirmDialog.Builder(view.context)
                        .setTitle("알림")
                        .setText(message)
                        .setCancelable(false)
                        .build()
                dialog.setOnClickListener { dialog1: DialogInterface?, which: Int ->
                    if (which == Dialog.BUTTON_POSITIVE) {
                        result.confirm()
                    }
                }
                dialog.show()
                return true
            }

            override fun onJsConfirm(view: WebView, url: String?, message: String?, result: JsResult): Boolean {
                val dialog = ConfirmDialog.Builder(view.context)
                        .setTitle("알림")
                        .setText(message)
                        .setCancelable(false)
                        .build()
                dialog.setOnClickListener { dialog1: DialogInterface?, which: Int ->
                    when (which) {
                        Dialog.BUTTON_POSITIVE -> result.confirm()
                        Dialog.BUTTON_NEGATIVE -> result.cancel()
                    }
                }
                dialog.show()
                return true
            }

            override fun onShowFileChooser(webView: WebView?, filePathCallback: ValueCallback<Array<Uri?>?>, fileChooserParams: FileChooserParams?): Boolean {

                return true
            }

        }


        webView.loadUrl(url + encoded)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            webView.setLayerType(View.LAYER_TYPE_HARDWARE, null)
        } else {
            webView.setLayerType(View.LAYER_TYPE_SOFTWARE, null)
        }

        val set: WebSettings = webView.settings
        if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.O) {
            set.setRenderPriority(WebSettings.RenderPriority.HIGH)
            set.layoutAlgorithm = WebSettings.LayoutAlgorithm.SINGLE_COLUMN
            set.setEnableSmoothTransition(true)
        }

        set.cacheMode = WebSettings.LOAD_CACHE_ELSE_NETWORK
        set.setAppCacheEnabled(true)
        set.domStorageEnabled = true
        set.javaScriptEnabled = true
        set.javaScriptCanOpenWindowsAutomatically = true
        set.setSupportMultipleWindows(true)
        set.useWideViewPort = true
        set.builtInZoomControls = true
        set.setSupportZoom(true)
        set.displayZoomControls = false

        webView.scrollBarStyle = View.SCROLLBARS_INSIDE_OVERLAY
        webView.setNetworkAvailable(true)
        webView.webViewClient = client
        webView.setWebChromeClient(chromeClient)

        //webView.clearCache(true)
        webView.clearHistory()




    }

    private fun initListener(){
        btn_back.setOnClickListener {
            finish()
        }
    }




}