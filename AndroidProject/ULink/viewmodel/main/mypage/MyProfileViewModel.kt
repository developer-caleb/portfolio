package com.bsni.nameq.v2.viewmodel.main.mypage

import android.util.Log
import androidx.core.view.isVisible
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.Define
import com.bsni.nameq.v2.item.mypage.MyInfoItem
import com.bsni.nameq.v2.item.mypage.MyInfoItem2
import com.bsni.nameq.v2.item.mypage.MyInfoItem3
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import kotlinx.android.synthetic.main.my_profile_fragment.*

class MyProfileViewModel(private val repository: Repository) : ViewModelBasic() {
    companion object {
        val TAG = MyProfileViewModel::class.java.simpleName
    }

    private var _myInfoItem = MutableLiveData<MyInfoItem>()
    val myInfoItem: LiveData<MyInfoItem>
        get() = _myInfoItem


    fun getMyInfo() {
        Log.d("TAG", "initLiveData: 함수 호출!3")
        var data = HashMap<String, Any>()
        var header = HashMap<String, Any>()
        data["muid"] = GlobalApplication.account.values.muid.toString()
        header["auth_token"] = Define.VALUES.TOKEN_VALUE
        //data["mode"] = "load"
        Log.d("TAG", "initLiveData: 함수 호출!4")
        addDisposable(
                // repository.getTojsonObj("member/profile", data, MyInfoItem::class.java)
                repository.getTojson2("member/profile", header, data, MyInfoItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            Log.d(TAG, "initLiveData: 함수 호출!5")
                            it?.let {

                                _myInfoItem.postValue(it as? MyInfoItem)
                                Log.d("################", "getMyInfo: ${it.toString()}")
                            }
                            /* if(it.vcard_image3 == ""){
                                //_myInfoItem.postValue(null)
                                Log.d("TAG", "initLiveData: 함수 호출!6")
                                _myInfoItem.postValue(null)
                            }else{
                                Log.d("TAG", "initLiveData: 함수 호출!7")
                                _myInfoItem.postValue(it)
                            }*/
                        }, {
                            logE("error=${it.localizedMessage}")
                            _myInfoItem.postValue(null)
                        })
        )
    }


}
