package com.bsni.nameq.v2.util.common

import android.util.Log
import com.bsni.nameq.BuildConfig

val TAG:String ="LOG"

fun logD(tag:String, msg:String){

    if(BuildConfig.BUILD_TYPE.equals("debug")){
        Log.d(tag, msg)
    }
}

fun logD(msg:String){
    if(BuildConfig.BUILD_TYPE.equals("debug")){
        Log.d(TAG, msg)
    }
}

fun logE(tag:String, msg:String){

    if(BuildConfig.BUILD_TYPE.equals("debug")){
        Log.e(tag, msg)
    }
}

fun logE(msg:String){
    if(BuildConfig.BUILD_TYPE.equals("debug")){
        Log.e(TAG, msg)
    }
}