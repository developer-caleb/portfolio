package com.bsni.nameq.v2.viewmodel.main.mynamecard

import android.os.Build
import android.telephony.PhoneNumberUtils
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.common.StringUtil
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.item.ShareItem
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import java.util.*
import kotlin.collections.ArrayList

class CardSearchViewModel(private val mainRepository: Repository,private val naverRepository : Repository, private val dbHelper: DBHelper) : ViewModelBasic() {

    private var _cardItems = MutableLiveData<ArrayList<NameCard>>(ArrayList())
    val cardItems: LiveData<ArrayList<NameCard>> get() = _cardItems

    private var _cardItem = MutableLiveData<NameCard>()
    val cardItem: LiveData<NameCard> get() = _cardItem

    private var _shareData= MutableLiveData<ShareItem>()
    val shareData: LiveData<ShareItem> get() = _shareData

    private var _mag= MutableLiveData<String>()
    val mag: LiveData<String> get() = _mag

    private var searchStr=""

    fun getCards(string: String){
        val arr=dbHelper.selectNameCard(string)
        searchStr=string
        _cardItems.postValue(arr)
    }

    fun setCardItem(po: Int){
        cardItems.value?.let {
            _cardItem.postValue(it[po])
        }

    }

    fun share(type: ShareItem.SHARE){
        cardItem.value?.let { item->
            val url = String.format("%s?uid=%d&group_type=%d", Define.URLS.SEND_NAME_CARD, GlobalApplication.account.values.muid, item.type)

            val builder = StringBuilder()
            if (StringUtil.isNotEmpty(item.name)) builder.append(String.format("이름 : %s\n", item.name))
            if (StringUtil.isNotEmpty(item.company)) builder.append(String.format("회사 : %s\n", item.company))
            if (StringUtil.isNotEmpty(item.level)) builder.append(String.format("직급 : %s\n", item.level))
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                if (StringUtil.isNotEmpty(item.hp)) builder.append(String.format("휴대번호 : %s\n", PhoneNumberUtils.formatNumber(item.hp, Locale.getDefault().country)))
            } else {
                if (StringUtil.isNotEmpty(item.hp)) builder.append(String.format("휴대번호 : %s\n", PhoneNumberUtils.formatNumber(item.hp)))
            }
            if (StringUtil.isNotEmpty(item.email)) builder.append(String.format("이메일 : %s\n", item.email))
            if (StringUtil.isNotEmpty(item.address)) builder.append(String.format("주소 : %s\n", item.address))

            val format: String = "유링크 앱에서 명함을 전송했습니다.\n\n%s\n연락처 및 명함첩에 저장"
            val message = String.format(format, builder.toString())

            when(type){
                ShareItem.SHARE.SNS, ShareItem.SHARE.BAND -> {
                    val res = shortenedURL(url)
                    if (res != "") {
                        _shareData.postValue(ShareItem(type = type, msg = message, url = url))
                    }
                }
                ShareItem.SHARE.KAKAO -> {
                    _shareData.postValue(ShareItem(type = type, msg = message, url = url))
                }
            }
        }
    }

    private fun shortenedURL(url: String):String{
        var urlStr=url
        var data=HashMap<String, Any>()
        data["url"] = url
        var headers=HashMap<String, Any>()
        headers["X-Naver-Client-Id"] = "9AB3kxReLgBgwGU2TR0p"
        headers["X-Naver-Client-Secret"] = "ygO_sFoezd"

        val key=ArrayList<String>()
        key.add("result")
        key.add("url")
        addDisposable(
                naverRepository.getTojsonOne("v1/util/shorturl.json", headers, data, key)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            it?.let {
                                urlStr=it
                            }

                        }, {
                            logE("error=${it.message}")
                        })
        )

        return urlStr
    }

    fun delNameCard(){

        cardItem.value?.let {
            val params: MutableMap<String, Any> = java.util.HashMap()
            params[Define.KEYS.AUTH_TOKEN] = Define.VALUES.TOKEN_VALUE
            params[Define.KEYS.MUID] = GlobalApplication.account.values.muid
            params[Define.KEYS.MODE] = Define.VALUES.DELETE
            var url="/ocrlogs"
            if (it.type == Define.VALUES.CARD_TYPE_LIVE) {
                params[Define.KEYS.FMUID] = it.uid
                url="/nameqlist"
            }else{
                params[Define.KEYS.IDX] = it.uid
            }

            addDisposable(
                    mainRepository.getTojsonOne(url, params, "msg")
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe({msg->
                                _mag.postValue(msg)
                                dbHelper.deleteNameCard(it)
                                getCards(searchStr)
                            }, {error ->
                                logE("error=${error.localizedMessage}")
                            })
            )
        }
    }



}