package com.bsni.nameq.v2.util.async

import com.bsni.nameq.common.Define.URLS
import com.google.gson.JsonElement
import io.reactivex.Single
import okhttp3.MultipartBody
import retrofit2.http.*

interface ApiData {

    /*
    *   QueryMap == get에서 주소에 붙이
    *   FieldMap
    *   Body == 보디에 바로 던지기 (json)
    * */



    //json
    @GET
    fun getToJosn(
            @Url url: String,
            @QueryMap body: MutableMap<String, Any>
    ): Single<JsonElement>

    @GET
    fun getToJosn(
            @Url url: String,
            @HeaderMap headers: MutableMap<String, Any>,
            @QueryMap body: MutableMap<String, Any>
    ): Single<JsonElement>


    @POST
    fun postTOJosn(
            @Url url: String,
            @HeaderMap headers: MutableMap<String, Any>,
            @QueryMap body: MutableMap<String, Any>
    ): Single<JsonElement>


    @POST
    fun postTOJosn2(
            @Url url: String,
            @HeaderMap headers: MutableMap<String, Any>,
            @Body body: MutableMap<String, Any>
    ): Single<JsonElement>

    @PUT
    fun putTojsonObj(
            @Url url: String,
            @HeaderMap headers: MutableMap<String, Any>,
            @Body body: MutableMap<String, Any>
    ): Single<JsonElement>


    @Multipart // need to add this comment
    @POST
    fun uploadfileTOJosn(
            @Url url: String,
            @HeaderMap headers: MutableMap<String, Any>,
            @PartMap file: MutableMap<String, Any>
            ): Single<JsonElement>


    @Multipart // need to add this comment
    @POST
    fun uploadfileTOJosn2(
            @Url url: String,
            @HeaderMap headers: MutableMap<String, Any>,
            @Part file: MultipartBody.Part
    ): Single<JsonElement>


    //json
    @Headers("Content-Type: application/json")
    @POST
    fun getJosn(
            @Url url: String,
            @Body body: MutableMap<String, Any>
    ): Single<JsonElement>

    @Headers("Content-Type: application/json")
    @HTTP(method = "DELETE", path = URLS.REPORT + URLS.EXPENSE, hasBody = true)
    fun delJosn(
            @HeaderMap headers: MutableMap<String, Any>,
            @Body body: MutableMap<String, Any>
    ): Single<String>


    @Headers("Content-Type: application/json")
    @GET
    fun getType(
            @Url url: String,
            @HeaderMap headers: MutableMap<String, Any>,
            @QueryMap body: MutableMap<String, Any>
    ): Single<JsonElement>


    @Headers("Content-Type: application/json")
    @POST
    fun getJosn2(
            @Url url: String,
            @Body body: MutableMap<String, Any>
    ): Single<JsonElement>

    @Headers("Authorization: KakaoAK 8a00587b519db08b919d52f856c50dc2")
    @GET
    fun getToKakao(
            @Url url: String,
            @QueryMap body: MutableMap<String, Any>
    ): Single<JsonElement>

}