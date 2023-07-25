package com.bsni.nameq.v2.util.common

import android.content.Context
import android.content.pm.PackageManager
import android.graphics.Point
import android.os.Build
import android.view.WindowManager


fun getInstallPackage(context: Context, packageName: String): Boolean {
    return try {
        val pm = context.packageManager
        val pi = pm.getPackageInfo(packageName.trim { it <= ' ' }, PackageManager.GET_META_DATA)
//            val appInfo = pi.applicationInfo
        // 패키지가 있을 경우.
//            LogUtil.d(SNSUtil.TAG, "Enabled value = " + appInfo.enabled)
        true
    } catch (e: PackageManager.NameNotFoundException) {
//            LogUtil.d(SNSUtil.TAG, "패키지가 설치 되어 있지 않습니다.")

        false
    }
}
