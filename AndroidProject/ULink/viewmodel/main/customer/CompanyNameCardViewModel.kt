package com.bsni.nameq.v2.viewmodel.main.customer

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.common.StringUtil
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.objects.api.SharedNameCardDetail
import com.bsni.nameq.v2.item.ResultItem
import com.bsni.nameq.v2.item.company.CompanyNameCardItem1
import com.bsni.nameq.v2.item.company.CompanyNameCardItem2
import com.bsni.nameq.v2.item.company.CompanyNameCardItem3
import com.bsni.nameq.v2.item.company.CompanyShareItem
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers

class CompanyNameCardViewModel(private val repository: Repository, private val subRepository: Repository, private val dbHelper: DBHelper) : ViewModelBasic() {


    private var _cncItems = MutableLiveData<ArrayList<Any>>()
    val cncItems: LiveData<ArrayList<Any>>
        get() = _cncItems



    private var _csitems = MutableLiveData<ArrayList<CompanyShareItem>>()
    val csitems: LiveData<ArrayList<CompanyShareItem>>
        get() = _csitems

    private var _tabsItems = MutableLiveData<ArrayList<String>>()
    val tabsItems: LiveData<ArrayList<String>>
        get() = _tabsItems

    private var _search = MutableLiveData(false)
    val search: LiveData<Boolean>
        get() = _search

    private var _spinnerItems = MutableLiveData<ArrayList<String>>()
    val spinnerItems: LiveData<ArrayList<String>>
        get() = _spinnerItems

    private var spinnerData=HashMap<String, String>()
    private var tabData=HashMap<String, String>()

    init {
        var arr=ArrayList<String>()
        spinnerData["등록일순"]="signdate"
        spinnerData["이름순"]="name"
        spinnerData["회사순"]="company"

        arr.add("등록일순")
        arr.add("이름순")
        arr.add("회사순")
        _spinnerItems.postValue(arr)

        arr=ArrayList()
        arr.add("공유받은 명함")
        arr.add("공유한 명함")
        arr.add("통합 명함")
        tabData["공유받은 명함"] = "load_new_cn"
        tabData["공유한 명함"] = "load_me2"
        tabData["통합 명함"] = "load_new_cn_all"

        _tabsItems.postValue(arr)

    }

    fun setShared1(po: Int){
        cncItems.value?.let {
            val item=it[po] as CompanyNameCardItem1
            val params=HashMap<String, Any>()
            params["auth_token"]= Define.VALUES.TOKEN_VALUE
            params[Define.KEYS.UID] = item.uid
            params[Define.KEYS.GROUP_TYPE] = item.group_type

            addDisposable(
                    subRepository.getTojsonObj("app/api/blkr/getCompanyCard.php?", params, SharedNameCardDetail::class.java)
                            .subscribeOn(Schedulers.io())
                            .flatMap { card ->

                                val nameCard = NameCard(item.group_type.toInt(), item.uid.toInt(), card)
                                dbHelper.insertNameCard(nameCard)

                                val params: MutableMap<String, Any> = java.util.HashMap()
                                params[Define.KEYS.AUTH_TOKEN] = Define.VALUES.TOKEN_VALUE
                                params[Define.KEYS.MUID] = GlobalApplication.account.values.muid
                                params[Define.KEYS.TYPEB] = card.typeb
                                params[Define.KEYS.CITY] = card.city
                                params[Define.KEYS.HP] = if (StringUtil.isNotEmpty(card.hp)) card.hp else ""
                                params[Define.KEYS.NAME] = if (StringUtil.isNotEmpty(card.name)) card.name else ""
                                params[Define.KEYS.COMPANY] = if (StringUtil.isNotEmpty(card.company)) card.company else ""
                                params[Define.KEYS.LEVEL] = if (StringUtil.isNotEmpty(card.level)) card.level else ""
                                params[Define.KEYS.IMAGE1] = if (StringUtil.isNotEmpty(card.vcardImage1)) card.vcardImage1 else ""
                                params[Define.KEYS.IMAGE2] = if (StringUtil.isNotEmpty(card.vcardImage2)) card.vcardImage2 else ""
                                params[Define.KEYS.IMAGE3] = if (StringUtil.isNotEmpty(card.vcardImage3)) card.vcardImage3 else ""
                                params[Define.KEYS.EMAIL] = if (StringUtil.isNotEmpty(card.email)) card.email else ""
                                params[Define.KEYS.ADDRESS] = if (StringUtil.isNotEmpty(card.address)) card.address else ""
                                params[Define.KEYS.TEL] = if (StringUtil.isNotEmpty(card.tel)) card.tel else ""
                                params[Define.KEYS.FAX] = if (StringUtil.isNotEmpty(card.fax)) card.fax else ""
                                params[Define.KEYS.WEBSITE] = if (StringUtil.isNotEmpty(card.website)) card.website else ""
                                params[Define.KEYS.PART] = if (StringUtil.isNotEmpty(card.part)) card.part else ""

                                repository.getTojsonObj("/v3/cardbooks/company/ocrlog/add", params, ResultItem::class.java)



                            }
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe({
                                it?.let {
                                    if (it.result) {
                                        getList()
                                    } else {
                                        _msg.postValue(it.msg)
                                    }

//                                    _csitems.postValue(it)
//                                    sharePostion=po
                                }

                            }, {
                                logE("error=${it.localizedMessage}")
                            })
            )
        }
    }




    private var sharePostion=0

    fun setShared3(po: Int){
        cncItems.value?.let {
            val item=it[po] as CompanyNameCardItem3
            val params=HashMap<String, Any>()
            params["auth_token"]= Define.VALUES.TOKEN_VALUE
            params["mode"]= "shared_list"
            params["uid"]= item.uid
            params["ocuid"]= 1000
            params["name"]= item.name
            params["hp"]= item.hp

            addDisposable(
                    repository.getTojson("biz_clistp2/", params, CompanyShareItem::class.java)
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe({
                                it?.let {
                                    _csitems.postValue(it)
                                    sharePostion = po
                                }

                            }, {
                                logE("error=${it.localizedMessage}")
                            })
            )
        }
    }

    fun addShared(po: Int){
        cncItems.value?.let { cardItems ->
            csitems.value?.let { it ->
                val cardItem=cardItems[sharePostion] as CompanyNameCardItem3
                val shareItem=it[po]

                val params=HashMap<String, Any>()
                params["auth_token"]= Define.VALUES.TOKEN_VALUE
//                params["mode"]= "shared_list"
                params["muid"]= GlobalApplication.account.values.muid
                params["cuid"]= cardItem.uid
                params["fmuid"]= shareItem.muid
                params["cname"]= cardItem.name

                params["group_type"]= 11
                params["description"]= "명함공유를 요청합니다."

                addDisposable(
                        repository.getTojsonObj("v3/cardbooks/company/request", params, ResultItem::class.java)
                                .subscribeOn(Schedulers.io())
                                .observeOn(AndroidSchedulers.mainThread())
                                .subscribe({ result ->
                                    result?.let {
                                        if (it.result) {
                                            getList()
                                        } else {
                                            _msg.postValue(it.msg)
                                        }
                                    }
                                    sharePostion = 0

                                }, {
                                    logE("error=${it.localizedMessage}")
                                })
                )

            }

        }
    }




    fun setSearch(){
        _search.postValue(!search.value!!)
    }

    fun setSpinnerPostion(po: Int){
        page=0
        spPo=po
        getList()
    }

    fun setTabPostion(po: Int){
        page=0
        tabPo=po
        getList()
    }

    fun setEditText(text: String){
        page=0
        editText=text
        getList()
    }

    val pageNum=10
    var page=0

    private var spPo=0
    private var tabPo=0
    private var editText=""

    fun getList(){

        val params=HashMap<String, Any>()
        params["auth_token"]= Define.VALUES.TOKEN_VALUE
        params["muid"]= GlobalApplication.account.values.muid
        params["mode"]= tabData[tabsItems.value?.get(tabPo)]!!
        params["q"]= editText
        params["cuid"]= 1000
        params["sort"]= spinnerData[spinnerItems.value?.get(spPo)]!!
        params["idx"]= page*pageNum

        val cls=when(tabPo){
            0 -> CompanyNameCardItem1::class.java
            1 -> CompanyNameCardItem2::class.java
            2 -> CompanyNameCardItem3::class.java
            else->return
        }

        addDisposable(
                repository.getTojson("biz_clistp2/", params, cls)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            it?.let {
                                if (it.size > 0) {
                                    if (page > 0) {
                                        cncItems.value?.let { items ->
                                            items.addAll(it)
                                            _cncItems.postValue(items)
                                        }


                                    } else {
                                        _cncItems.postValue(it as ArrayList<Any>)
                                    }
                                    page++
                                }
                            }

                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )

    }

    fun getNameCard(poItem: Int, poTab: Int):NameCard?{
        cncItems.value?.let {

            val item=it[poItem]
            return when(poTab){
                0 -> dbHelper.selectNameCard((item as CompanyNameCardItem1).uid.toInt())
                1 -> dbHelper.selectNameCard((item as CompanyNameCardItem2).uid.toInt())
                2 -> dbHelper.selectNameCard((item as CompanyNameCardItem3).uid.toInt())
                else -> null
            }
        }

        return null
    }

}
