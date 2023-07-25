package com.bsni.nameq.v2.viewmodel.main.mynamecard

import android.location.Location
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.item.*
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.functions.BiFunction
import io.reactivex.schedulers.Schedulers
import java.util.*

class CardDetaliViewModel(private val mainRepository: Repository, private val dbHelper: DBHelper,private val kakaoRepository: Repository):ViewModelBasic() {

    private var _cardItem = MutableLiveData<NameCard>()
    val cardItem: LiveData<NameCard> get() = _cardItem

    private var _cardDel = MutableLiveData<Boolean>(false)
    val cardDel: LiveData<Boolean> get() = _cardDel

    private var _rankItem = MutableLiveData<RankItem>(RankItem())
    val rankItem: LiveData<RankItem> get() = _rankItem

    fun setCardItem(item: NameCard){
        _cardItem.postValue(item)
        logD("item.latitude=${item.latitude}")
        if (item.latitude==null || item.latitude.equals(0.0) || item.latitude.equals(0) ){
            if (item.address!=null){
                getAddress(item.address)
            }
        }
    }

    fun delNameCard(){

        cardItem.value?.let {namecard ->
            val params: MutableMap<String, Any> = java.util.HashMap()
            params[Define.KEYS.AUTH_TOKEN] = Define.VALUES.TOKEN_VALUE
            params[Define.KEYS.MUID] = GlobalApplication.account.values.muid
            params[Define.KEYS.MODE] = Define.VALUES.DELETE
            var url="/ocrlogs"
            if (namecard.type == Define.VALUES.CARD_TYPE_LIVE) {
                params[Define.KEYS.FMUID] = namecard.uid
                url="/nameqlist"
            }else{
                params[Define.KEYS.IDX] = namecard.uid
            }

            addDisposable(
                    mainRepository.getTojsonObj(url, params, ResultItem::class.java)
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe({
                                it?.let {result->
                                    if(result.result){
                                        logD("result=${result.result}")
                                        _cardDel.postValue(result.result)
                                        dbHelper.deleteNameCard(namecard)
                                    }
                                    _msg.postValue(it.msg)
                                }
                            }, { error ->
                                logE("error=${error.localizedMessage}")
                            })
            )
        }
    }


    fun getRankItem(mUid: Int){

        val params: MutableMap<String, Any> = HashMap()
        params["auth_token"] = Define.VALUES.TOKEN_VALUE
        params["muid"] = GlobalApplication.account.values.muid
        params["f_muid"] = mUid
        params["group_type"] = "11"
        params["mode"] = "load"

        addDisposable(
                mainRepository.getTojsonObj("biz_closeness", params, Closeness2Itme::class.java)
                        .subscribeOn(Schedulers.io())
                        .zipWith(
                                mainRepository.getTojsonObj("biz_estimate", params, Mgrade2Itme::class.java)
                                        .subscribeOn(Schedulers.io()),
                                BiFunction { closeness: Closeness2Itme, mgrade: Mgrade2Itme ->
                                    RankItem(mgrade.mgrade,mgrade.uid, closeness.closeness,closeness.uid)
                                }
                        )
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({ it ->
                            it?.let { item ->
                                if (item.closeness == "") {
                                    _rankItem.postValue(RankItem())
                                } else {
                                    _rankItem.postValue(item)
                                }
                            }
                        }, { error ->
                            logE("error=${error.localizedMessage}")
                        })
        )

    }

    fun getAddress(address:String):Location?{
        val location:Location? =null
        val params: MutableMap<String, Any> = HashMap()
        params["query"] = address



        addDisposable(
                kakaoRepository.getToBody("v2/local/search/address.json", params)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({ it ->
                            it?.let { json ->
                                logD("json=${json.toString()}")
                                val jobj= json.asJsonObject.get("documents").asJsonArray
                                jobj?.let {
                                    if(it.size()>0){
                                        val jarr=jobj.get(0).asJsonObject
                                        jarr?.let {obj->
                                            val card=cardItem.value
                                            card?.let {
                                                it.latitude=obj.get("y").asDouble
                                                it.longitude=obj.get("x").asDouble
                                                _cardItem.postValue(it)
                                            }

                                        }
                                        logD("jobj=${jarr.get("x").asString}")
                                    }

                                }
                            }
                        }, { error ->
                            logE("error=${error.localizedMessage}")
                        })
        )




        return location
    }

    fun addLink(){
        cardItem.value?.let {namecard ->
            val params: MutableMap<String, Any> = HashMap()
            params[Define.KEYS.AUTH_TOKEN] = Define.VALUES.TOKEN_VALUE
            params["muid"] = GlobalApplication.account.values.muid
            params["f_muid"] = namecard.uid
            params["mode"] = "insert"
            var url="/biz_live"


            addDisposable(
                    mainRepository.getTojsonObj(url, params, ResultItem::class.java)
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe({
                                it?.let {result->
                                    if(result.result){
                                        logD("result=${result.result}")


                                    }
                                    _msg.postValue(it.msg)
                                }


                            }, { error ->
                                logE("error=${error.localizedMessage}")
                            })
            )
        }
    }


}


