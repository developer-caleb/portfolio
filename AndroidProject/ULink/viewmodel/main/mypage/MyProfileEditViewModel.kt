package com.bsni.nameq.v2.viewmodel.main.mypage

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.Define.KEYS
import com.bsni.nameq.common.Define.VALUES
import com.bsni.nameq.objects.Account
import com.bsni.nameq.v2.item.ResultItem
import com.bsni.nameq.v2.item.mypage.MyInfoItem
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import java.util.*


class MyProfileEditViewModel(private val repository: Repository) : ViewModelBasic() {
    private var _myInfoItem = MutableLiveData<MyInfoItem>()
    val myInfoItem: LiveData<MyInfoItem> get() = _myInfoItem

    private var _check = MutableLiveData<Boolean>(false)
    val check: LiveData<Boolean> get() = _check


    fun setMyInfoItem(item: MyInfoItem){
        _myInfoItem.postValue(item)
    }


    fun edityProfile(profile: Account.Profile){
        val params: MutableMap<String, Any> = HashMap()
        params[KEYS.AUTH_TOKEN] = VALUES.TOKEN_VALUE
        params[KEYS.MODE] = VALUES.SAVE
        params[KEYS.MUID] = GlobalApplication.account.values.muid
        params[KEYS.NAME] = profile.name
        params[KEYS.COMPANY] = profile.company
        params[KEYS.CMP_CD] = profile.cmp_cd
        params[KEYS.PART] = profile.part
        params[KEYS.LEVEL] = profile.level
        params[KEYS.HP] = profile.hp //인증시 핸드폰 번호는 넘어간다.

        params[KEYS.EMAIL] = profile.email
        params[KEYS.ADDRESS] = profile.address
        params[KEYS.TEL] = profile.tel
        params[KEYS.FAX] = profile.fax
        params[KEYS.WEBSITE] = profile.website
//        params.put(Define.KEYS.CERT_NUM, profile.cert_num);
        //        params.put(Define.KEYS.CERT_NUM, profile.cert_num);
        params[KEYS.CITY] = profile.city
        params[KEYS.BIRTHDAY] = profile.birthday
        params[KEYS.INTRODUCE] = profile.introduce
        params[KEYS.TYPEB] = profile.typeb
        params[KEYS.MAIN_BUSINESS] = profile.main_business

        addDisposable(
                repository.getTojsonObj("biz_profile", params, ResultItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            it?.let {
                                if (it.result){
                                    _check.postValue(it.result)
                                    _msg.postValue(it.msg)
                                }else{

                                }
                            }
                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }

}
