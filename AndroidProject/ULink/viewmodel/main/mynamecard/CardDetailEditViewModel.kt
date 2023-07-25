package com.bsni.nameq.v2.viewmodel.main.mynamecard

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers

class CardDetailEditViewModel(private val mainRepository: Repository,private val dbHelper: DBHelper):ViewModelBasic() {

    private var _cardItem = MutableLiveData<NameCard>()
    val cardItem: LiveData<NameCard> get() = _cardItem

    private var _check = MutableLiveData<Boolean>()
    val check: LiveData<Boolean> get() = _check

    fun setCardItem(item:NameCard){
        _cardItem.postValue(item)
    }


    fun updata(item:NameCard){

        val params: MutableMap<String, Any> = java.util.HashMap()
        params["auth_token"] = Define.VALUES.TOKEN_VALUE
        params["uid"] = item.uid
        params["website"] = "www.bizq.kr"
        params["address"] = if (item.address==null) "" else item.address
        params["level"] = if (item.level==null) "" else item.level
        params["part"] = if (item.part==null) "" else item.part
        params["hp"] = if (item.hp==null) "" else item.hp
        params["cert_num"] = if (item.certNum==null) "" else item.certNum
        params["mode"] = "update1"
        params["name"] = if (item.name==null) "" else item.name
        params["tel"] = if (item.tel==null) "" else item.tel
        params["company"] = if (item.company==null) "" else item.company
        params["fax"] = if (item.fax==null) "" else item.fax
        params["email"] = if (item.email==null) "" else item.email


        addDisposable(
                mainRepository.getTojsonOne("/biz_ocrlogs", params, "result")
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({msg->
                            msg?.let {
                                if (it.toBoolean()){
                                    setCardItem(item)
                                    _check.postValue(it.toBoolean())
                                    dbHelper.updateNameCard(item)
                                }

                            }


                        }, {error ->
                            logE("error=${error.localizedMessage}")
                        })
        )

    }

}