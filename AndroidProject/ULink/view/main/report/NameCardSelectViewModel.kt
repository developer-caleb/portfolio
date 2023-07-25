package com.bsni.nameq.v2.view.main.report

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.item.CompanyGroupNameCardItem
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import kotlin.collections.ArrayList
import kotlin.collections.HashMap

class NameCardSelectViewModel(val repository: Repository, val dbHelper: DBHelper)  : ViewModelBasic() {
    //var TAG : String = "NameCardSelectViewModel"
    private var _nameCardItems = MutableLiveData<ArrayList<NameCard>>()
    private var prenameCardItems = ArrayList<NameCard>()
    val nameCardItems: LiveData<ArrayList<NameCard>>
        get() = _nameCardItems

    private var _companyGroupNameCardItem = MutableLiveData<ArrayList<CompanyGroupNameCardItem>>()
    val companyGroupNameCardItem: LiveData<ArrayList<CompanyGroupNameCardItem>>
        get() = _companyGroupNameCardItem


    private var _isSerch = MutableLiveData<Boolean>(false)
    val isSerch: LiveData<Boolean>
        get() = _isSerch

    enum class Type {
        GROUP, COMPANY
    }
    var type:Type = Type.GROUP


    fun setSerch(){
        isSerch.value?.let {
            _isSerch.postValue(!it)
        }
    }

    fun setCheck(po: Int){
        nameCardItems.value?.let {
            it[po].groupCheck=!it[po].groupCheck
            _nameCardItems.postValue(it)
        }
    }

    fun setCheckAll(isCheck: Boolean){
        nameCardItems.value?.let {
            it?.let {
                for(item in it){
                    item.groupCheck=isCheck
                }
                _nameCardItems.postValue(it)
            }


        }
    }


  fun getNameCards(){
        type=Type.GROUP
      prenameCardItems= dbHelper.selectCards("signdate")
        _nameCardItems.postValue(prenameCardItems)
      Log.d(TAG, "getNameCards: prenameCardItems"+prenameCardItems.toString())
      Log.d(TAG, "getNameCards: _nameCardItems"+_nameCardItems.toString())
    }
    fun getqueryNameCards(string: String){
        if(string.equals("")){
            _nameCardItems.postValue(prenameCardItems)
        }else {
            val arr = ArrayList<NameCard>()
            prenameCardItems?.let {
                for (item in it) if (string in item.company || string in item.name) arr.add(item)
            };
            Log.d(TAG, "getNameCards: query=>" + string)
            Log.d(TAG, "getNameCards: " + arr.toString())
            arr.sortBy { it.name}
            _nameCardItems.postValue(arr)
        }
    }





    fun getNameCards(groupIdx: Int){
        type=Type.GROUP
        _nameCardItems.postValue(dbHelper.selectGroupCards(groupIdx, "signdate"))
    }

    fun getNameCardsToCmpCd(cmpCd: Int){
        type=Type.GROUP
        _nameCardItems.postValue(dbHelper.selectCmpCdCards(cmpCd))
    }

//    fun getNameCardsToCompany(company: String){
//        type=Type.GROUP
//        _nameCardItems.postValue(dbHelper.selectCardLikeCompany(company))
//    }

    // 2020-11-29 회사명으로 검색
    fun getNameCardsToCompany(company: String){
        type=Type.GROUP
        _nameCardItems.postValue(dbHelper.selectCompanyNameCards(company))
    }

    fun getSelect():ArrayList<NameCard>{
        val arr=ArrayList<NameCard>()
        nameCardItems.value?.let {
            for (item in it){
                if (item.groupCheck){
                    arr.add(item)
                }
            }
        }
        return arr
    }


    fun getCompanyNameCards(groupIdx: Int){
        type=Type.COMPANY
        var data=HashMap<String, Any>()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["muid"] = GlobalApplication.account.values.muid
        if (groupIdx == -1){
            data["buid"] = GlobalApplication.account.values.buid
        }else{
            data["buid"] = -1
        }

        data["q"] = ""
        data["ocuid"] = groupIdx
        data["mode"] = "load_incl"

        addDisposable(
                repository.getTojson("app/api/blkr/getCompanyGroup.php", data, CompanyGroupNameCardItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({

                            it?.let {
                                val arr=ArrayList<NameCard>()
                                for (item in it){
                                    val nameCard=NameCard()
                                    if (item.muid!=null){
                                        nameCard.uid=item.muid.toInt()
                                        nameCard.name=item.name
                                        nameCard.email=item.email
                                        nameCard.hp=item.sharedHP
                                        nameCard.tel=item.tel
                                        nameCard.fax=item.fax
                                        nameCard.level=item.level
                                        nameCard.photo=item.photo1
                                        nameCard.image1=item.vcard_image1
                                        arr.add(nameCard)
                                    }

                                }
                                _nameCardItems.postValue(arr)
//                                _companyGroupNameCardItem.postValue(it)
                            }

                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }

}
