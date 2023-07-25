package com.bsni.nameq.v2.util.async

import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import android.util.Log
import com.google.gson.Gson
import com.google.gson.JsonElement
import com.google.gson.reflect.TypeToken
import io.reactivex.Single
import okhttp3.MultipartBody

class Repository(private val retrofit: RetrofitHelper) {

    val api: ApiData = retrofit.getRetrofit().create(ApiData::class.java)
    val TAG = "Repository"
    fun getTojsonOne(url: String, params: MutableMap<String, Any>, key: String): Single<String> {
        return api.getToJosn(url, params).map { res: JsonElement ->

            try {
                return@map res.asJsonObject.get(key).asString
            }
            catch (e: Exception) {
                return@map ""
            }
        }
    }


    fun getTojsonOne(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, key: ArrayList<String>): Single<String> {
        return api.getToJosn(url, headers, params).map { res: JsonElement ->
            var jsonObject=res.asJsonObject
            for (i in 0 until  key.size-1){
                jsonObject=jsonObject.get(key[i]).asJsonObject
            }

            return@map jsonObject.get(key[key.size - 1]).asString
        }
    }

    fun <T> getTojsonObj(url: String, params: MutableMap<String, Any>, classOfT: Class<T>): Single<T> {
        return api.getToJosn(url, params).map { res: JsonElement ->

            try {
                return@map Gson().fromJson(res, classOfT)
            }
            catch (e: Exception) {
                return@map null
            }
        }
    }

    fun <T> getTojsonObj2(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, classOfT: Class<T>): Single<T> {
        return api.getToJosn(url, headers, params).map { res: JsonElement ->

            try {
                return@map Gson().fromJson(res, classOfT)
            }
            catch (e: Exception) {
                return@map null
            }
        }
    }

    fun <T> postTojsonObj2(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, classOfT: Class<T>): Single<T> {
        return api.postTOJosn2(url, headers, params).map { res: JsonElement ->

            try {
                return@map Gson().fromJson(res, classOfT)
            }
            catch (e: Exception) {
                return@map null
            }
        }
    }

    fun <T> putTojsonObj(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, classOfT: Class<T>): Single<T> {

        return api.putTojsonObj(url, headers, params).map { res: JsonElement ->

            try {
                return@map Gson().fromJson(res, classOfT)
            }
            catch (e: Exception) {
                return@map null
            }
        }
    }



    fun <T> uploadfileTOJosn(url: String, headers: MutableMap<String, Any>, files: MutableMap<String, Any>, classOfT: Class<T>): Single<T> {
        return api.uploadfileTOJosn(url, headers, files).map { res: JsonElement ->

            try {
                return@map Gson().fromJson(res, classOfT)
            }
            catch (e: Exception) {
                return@map null
            }
        }
    }

    fun <T> uploadfileTOJosn2(url: String, headers: MutableMap<String, Any>, files: MultipartBody.Part, classOfT: Class<T>): Single<T> {
        return api.uploadfileTOJosn2(url, headers, files).map { res: JsonElement ->

            try {
                return@map Gson().fromJson(res, classOfT)
            }
            catch (e: Exception) {
                return@map null
            }
        }
    }




    fun <T>  getTojson(url: String, params: MutableMap<String, Any>, classOfT: Class<T>): Single<ArrayList<T>> {
        return api.getToJosn(url, params).map { res: JsonElement ->  T

//            var body=res.toString()
            var body=res.asJsonObject.get("data").asJsonArray.toString()
            var typeToken=TypeToken.getParameterized(ArrayList::class.java, classOfT).type

            var any:ArrayList<T> = Gson().fromJson(body, typeToken)

            return@map any
        }
    }
    fun <T>  getTojsonloadwork(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, classOfT: Class<T>): Single<ArrayList<T>> {
        return api.getToJosn(url, headers, params).map { res: JsonElement ->  T
            Log.d(TAG, "getTojson: ====================task가져오기")
            Log.d(TAG, "getTojson: " + res.toString())
//            var body=res.toString()
            var body=res.asJsonObject.get("list").asJsonArray.toString()
            var typeToken=TypeToken.getParameterized(ArrayList::class.java, classOfT).type
            var any:ArrayList<T> = Gson().fromJson(body, typeToken)
            return@map any
        }
    }


    fun <T>  getTojson(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, classOfT: Class<T>, key: String): Single<ArrayList<T>> {
        return api.getToJosn(url, headers, params).map { res: JsonElement ->  T

//            var body=res.toString()
            var body=res.asJsonObject.get(key).asJsonArray.toString()
            var typeToken=TypeToken.getParameterized(ArrayList::class.java, classOfT).type

            var any:ArrayList<T> = Gson().fromJson(body, typeToken)

            return@map any
        }
    }

    fun  getjsonToMap(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>): Single<HashMap<String, Any>> {
        return api.getToJosn(url, headers, params).map { res: JsonElement ->
            var mapp=Gson().fromJson( res, object : TypeToken<HashMap<String?, Any?>?>() {}.type) as HashMap<String, Any>
            return@map mapp
        }
    }



    fun <T>  getTojson2(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, classOfT: Class<T>): Single<T> {
        return api.getToJosn(url, headers, params).map { res: JsonElement ->  T

           // var body=res.toString()
            //var body=res.asJsonObject.asJsonArray.toString()
            //var body=res.asJsonObject.asJsonArray.toString()
            //var typeToken=TypeToken.getParameterized(ArrayList::class.java, classOfT).type

            var any:T=Gson().fromJson(res, classOfT)

            return@map any
        }
    }
/*
 연습용으로 복사했음 버려도 됨
    fun <T>getlist2(url:String,params: MutableMap<String,Any>,classOfT:Class<T>): Single<T> {
        return api.getJosn2(url,params).map { res:JsonElement ->  T
            var any:T=Gson().fromJson(res,classOfT)

            return@map any
        }
    }*/




    fun <T>  postTojson(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>, classOfT: Class<T>, key: String): Single<ArrayList<T>> {
        return api.postTOJosn(url, headers, params).map { res: JsonElement ->  T

//            var body=res.toString()
            var body=res.asJsonObject.get(key).asJsonArray.toString()
            var typeToken=TypeToken.getParameterized(ArrayList::class.java, classOfT).type

            var any:ArrayList<T> = Gson().fromJson(body, typeToken)

            return@map any
        }
    }

    fun delJosn(url: String, headers: MutableMap<String, Any>, params: MutableMap<String, Any>): Single<String> {
        return api.delJosn(headers, params)
    }

    //stores
    fun <T>  getjson(url: String, params: MutableMap<String, Any>, classOfT: Class<T>): Single<ArrayList<T>> {
        return api.getJosn(url, params).map { res: JsonElement ->  T
            //var any:T=Gson().fromJson(res,classOfT)
//            var body=res.asJsonObject.get("list").asJsonArray.toString()
            var body=res.toString()
            //logD(body)
//            var any:T=Gson().fromJson(body,classOfT)
//            var typeToken=object:TypeToken<ArrayList<T>>(){}.type
            var typeToken=TypeToken.getParameterized(ArrayList::class.java, classOfT).type

            var any:ArrayList<T> = Gson().fromJson(body, typeToken)

            return@map any
        }
    }


//    fun <T>getType(url:String,params: MutableMap<String,Any>,classOfT:Class<T>): Single<ArrayList<T>> {
//        return api.getType(url,params).map { res:JsonElement ->  T
//
//            var body=res.asJsonObject.get("stores").asJsonArray.toString()
//            logD(body)
////            var any:T=Gson().fromJson(body,classOfT)
//            var typeToken=TypeToken.getParameterized(ArrayList::class.java, classOfT).type
//            var any:ArrayList<T> = Gson().fromJson(body,typeToken)
//            logD(any.get(0).toString())
//            return@map any
//        }
//    }

    fun <T>getlist2(url: String, params: MutableMap<String, Any>, classOfT: Class<T>): Single<T> {
        return api.getJosn2(url, params).map { res: JsonElement ->  T
            var any:T=Gson().fromJson(res, classOfT)

            return@map any
        }
    }

    fun getToBody(url: String, params: MutableMap<String, Any>): Single<JsonElement>{
        return api.getToKakao(url, params)
    }


}