package com.bsni.nameq.v2.viewmodel.main.mynamecard

import android.os.Build
import android.telephony.PhoneNumberUtils
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.common.Define.KEYS
import com.bsni.nameq.common.Define.VALUES
import com.bsni.nameq.common.StringUtil
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.item.ClosenessItem
import com.bsni.nameq.v2.item.MgradeItem
import com.bsni.nameq.v2.item.ResultItem
import com.bsni.nameq.v2.item.ShareItem
import com.bsni.nameq.v2.item.ShareItem.SHARE
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import java.util.*
import kotlin.collections.ArrayList
import kotlin.collections.HashMap


class CardListViewModel(private val mainRepository: Repository, private val subRepository: Repository, private val naverRepository: Repository, private val dbHelper: DBHelper) : ViewModelBasic() {

    private var _orders = MutableLiveData<HashMap<String, String>>()
    val orders: LiveData<HashMap<String, String>> get() = _orders

    private var _isEdit = MutableLiveData<Boolean>(true)
    val isEdit: LiveData<Boolean> get() = _isEdit

    private var _isGroupEdit = MutableLiveData<Boolean>(false)
    val isGroupEdit: LiveData<Boolean> get() = _isGroupEdit

    private var _isFab = MutableLiveData<Boolean>(false)
    val isFab: LiveData<Boolean> get() = _isFab

    private var _cardItems = MutableLiveData<ArrayList<NameCard>>(ArrayList())
    val cardItems: LiveData<ArrayList<NameCard>> get() = _cardItems

    private var _cardItem = MutableLiveData<NameCard>()
    val cardItem: LiveData<NameCard> get() = _cardItem

    private var _shareData= MutableLiveData<ShareItem>()
    val shareData: LiveData<ShareItem> get() = _shareData

    private var _mag= MutableLiveData<String>()
    val mag: LiveData<String> get() = _mag

    var groupImportantPerson =ArrayList<MgradeItem>(ArrayList())
    var groupClosePersonItems =ArrayList<ClosenessItem>(ArrayList())

    var isBottomSheet=false
    private var orderVal="signdate"
    private var groupVal=GroupName.ALL
    private var groupId=0

    enum class GroupName{
        ALL,LINK,OCR,IMPORTANTPERSON,CLOSEPERSON,NONE
    }

    init {
        val orders=HashMap<String, String>()
        orders["등록일순"]="signdate"
        orders["이름순"]="name"
        orders["회사순"]="company"
        _orders.postValue(orders)

    }

    fun setEditing(){
        _isEdit.postValue(!isEdit.value!!)
    }

    fun setFab(){
        _isFab.postValue(!isFab.value!!)
    }

    fun setOrder(order: String){
        orderVal= orders.value?.get(order) ?: ""
        logD("setOrder=${order} value=${orders.value?.get(order)}")
        getNameCardItems()
    }
    fun setGroup(group: GroupName){
        groupVal=group
        getNameCardItems()
    }

    fun setGroup(group: GroupName, groupId: Int){
        groupVal=group
        this.groupId=groupId
        getNameCardItems()
    }


    fun getNameCardItems(){
        logD("getNameCardItems=${groupVal}")
        logD("명함 다시 불러오기!!!!!!!!!!!!!!!")
        var array=ArrayList<NameCard>()
        when(groupVal){
            GroupName.ALL -> {
                array = dbHelper.selectCards(orderVal)
            }
            GroupName.LINK -> {
                array = dbHelper.selectNameCard(10, orderVal)
            }
            GroupName.OCR -> {
                array = dbHelper.selectNameCard(11, orderVal)
            }
            GroupName.IMPORTANTPERSON -> {
                val tempArray = dbHelper.selectCards(orderVal)
                logD("groupImportantPerson " + groupImportantPerson.size)
                for (item in tempArray) {
                    //groupImportantPerson 비교
                    for (groupItem in groupImportantPerson) {
                        if (item.uid == groupItem.fmuid) {
                            array.add(item)
                        }
                    }

                }
            }
            GroupName.CLOSEPERSON -> {
                val tempArray = dbHelper.selectCards(orderVal)
                logD("groupClosePersonItems " + groupClosePersonItems.size)
                for (item in tempArray) {
                    //groupClosePersonItems 비교
                    for (groupItem in groupClosePersonItems) {
                        if (item.uid == groupItem.fmuid) {
                            array.add(item)
                        }
                    }
                }
            }
            GroupName.NONE -> {
                array = dbHelper.selectGroupCards(groupId, orderVal)
            }
        }
        _cardItems.postValue(array)
    }

    fun setUiCheck(check: Boolean){
        cardItems.value?.let {
            for (item in it){
                item.UICheck=check
            }
            if (it.size>0){
                _cardItems.postValue(cardItems.value)
            }
        }
    }

    fun clanCheck(){
        cardItems.value?.let {
            for (item in it){
                item.groupCheck=false
            }
            if (it.size>0){
                _cardItems.postValue(cardItems.value)
            }
        }
    }

    fun groupCheck(po: Int){
        cardItems.value?.let {
            it[po].groupCheck= !it[po].groupCheck
            _cardItems.postValue(cardItems.value)
        }
        var count=0
        cardItems.value?.let {
            for (item in it){
                if (item.groupCheck){
                    count++
                }
            }
        }
        _isGroupEdit.value=count>0
    }

    fun getSelectItmes():ArrayList<NameCard>{
        var arr=ArrayList<NameCard>()
        cardItems.value?.let {
            for (item in it){
                if (item.groupCheck){
                    arr.add(item)
                }
            }
        }
        return arr
    }

    fun getGroup(){
        var data=HashMap<String, Any>()
        data["muid"] = GlobalApplication.account.values.muid.toString()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        addDisposable(
                subRepository.getTojson("mgrade/list", data, MgradeItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            groupImportantPerson = it

                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }

    fun getClosePerson(){
        var data=HashMap<String, Any>()
        data.put("muid", GlobalApplication.account.values.muid.toString())
        data.put("auth_token", Define.VALUES.TOKEN_VALUE)
        addDisposable(
                subRepository.getTojson("closeness/list", data, ClosenessItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            groupClosePersonItems = it

                            logD("it.size=${it.size}")

                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }
    //...누르면
    fun setCardItem(po: Int){
        cardItems.value?.let {
            _cardItem.postValue(it[po])
            isBottomSheet=true  //이건 별로 의미 없어보이는데
        }

    }

    //...누르면 이게 활성화 됨
    fun share(type: SHARE){
        cardItem.value?.let { item->
            val url = String.format("%s?uid=%d&group_type=%d", Define.URLS.SEND_NAME_CARD, item.uid, item.type)

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
                SHARE.SNS, SHARE.BAND -> {
                    val res = shortenedURL(url)
                    if (res != "") {
                        _shareData.postValue(ShareItem(type = type, msg = message, url = url))
                    }
                }
                SHARE.KAKAO -> {
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
                                logD(it.toString())
//                                return@let it
                                urlStr=it
                            }

                        }, {
                            logE("error=${it.message}")
                        })
        )

        return urlStr
    }


    fun shareNameCard(selected: ArrayList<NameCard>){
        var uidList=""
        for (item in selected){
            uidList+="${item.uid},"
        }
        uidList=uidList.dropLast(1)


        val params = HashMap<String, Any> ()
        params["auth_token"] = VALUES.TOKEN_VALUE
        params["mode"] = VALUES.INSERT
        params["muid"] = GlobalApplication.account.values.muid.toString()
        params["group_type"] = VALUES.CARD_TYPE_OCR.toString() //, 로 구분자 할것

        params["creater_uid"] = GlobalApplication.account.values.muid.toString()
        params["creater_buid"] = GlobalApplication.account.values.buid.toString()
        params["content_type"] = "4" //4:명함

        params["content_uid"] = cardItem.value!!.uid.toString() //, 로 구분자 할것

        params["target_muid"] = uidList //추후 추가될 부분

        params["target_group"] = "-1"
        params["sub_add"] = "0"
        params["target_cellnum"] = "-1" //추후 추가될 부분

        params["uid"] = cardItem.value!!.uid.toString()
        params["group_type"] = VALUES.CARD_TYPE_OCR.toString()
        params["muids"] = uidList

        addDisposable(
                mainRepository.getTojsonOne("/share_cont", params, "msg")
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({

                            _mag.postValue(it)


                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }


    fun allDelNameCard(selectNameCard:ArrayList<NameCard>){
        val uids=getUids(selectNameCard)
        logD("allDelNameCard_uids=${uids}")
        if (uids==""){
            _msg.postValue("선택 된 명함이 없습니다.")
            return
        }

        val params: MutableMap<String, Any> = java.util.HashMap()
        params["auth_token"] = VALUES.TOKEN_VALUE
        params["muid"] = GlobalApplication.account.values.muid
        params["uids"] = getUids(selectNameCard)


        var url="/v3/cardbooks/delete_all"


        addDisposable(
                mainRepository.getTojsonObj(url, params, ResultItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            if (it.result){

                                for(item in selectNameCard){
                                    dbHelper.deleteNameCard(item)
                                }
                                getNameCardItems()
                                _isEdit.postValue(true)
                            }

                            _mag.postValue(it.msg)


                        }, {error ->
                            logE("error=${error.localizedMessage}")
                        })
        )
    }

    fun getUids(selectNameCard:ArrayList<NameCard>):String{
        var str=""
        for (item in selectNameCard){
            if(item.type==10){
                str+="${item.uid},"
            }else if (item.type==11){
                str+="u${item.uid},"
            }
        }
        return str
    }



    fun delNameCard(){

        cardItem.value?.let {
            val params: MutableMap<String, Any> = java.util.HashMap()
            params[KEYS.AUTH_TOKEN] = VALUES.TOKEN_VALUE
            params[KEYS.MUID] = GlobalApplication.account.values.muid
            params[KEYS.MODE] = VALUES.DELETE
            var url="/ocrlogs"
            if (it.type == VALUES.CARD_TYPE_LIVE) {
                params[KEYS.FMUID] = it.uid
                url="/nameqlist"
            }else{
                params[KEYS.IDX] = it.uid
            }

            addDisposable(
                    mainRepository.getTojsonOne(url, params, "msg")
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe({msg->
                                _mag.postValue(msg)
                                //db까지 정리
                                dbHelper.deleteNameCard(it)
                                getNameCardItems()
                            }, {error ->
                                logE("error=${error.localizedMessage}")
                            })
            )
        }
    }





//    CRUD_OCR = "/ocrlogs";
//    CRUD_LIVE = "/nameqlist";

}