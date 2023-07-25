package com.bsni.nameq.v2.viewmodel.main.mynamecard

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.R
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.Define
import com.bsni.nameq.v2.item.RankItem
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.functions.BiFunction
import io.reactivex.schedulers.Schedulers

class RankEditViewModel(private val mainRepository: Repository) : ViewModelBasic() {

    private var _rankItem = MutableLiveData<RankItem>()
    val rankItem: LiveData<RankItem> get() = _rankItem

    private var _check = MutableLiveData<Boolean>()
    val check: LiveData<Boolean> get() = _check


    var rbCloseness = HashMap<Int, String>()
    var rbGrade = HashMap<Int, String>()
    var uid = 0

    init {
        rbCloseness[R.id.rbCloseness1] = "1"
        rbCloseness[R.id.rbCloseness2] = "2"
        rbCloseness[R.id.rbCloseness3] = "3"
        rbCloseness[R.id.rbCloseness4] = "4"
        rbCloseness[R.id.rbCloseness5] = "5"

        rbGrade[R.id.rbGrade1] = "A"
        rbGrade[R.id.rbGrade2] = "B"
        rbGrade[R.id.rbGrade3] = "C"
        rbGrade[R.id.rbGrade4] = "D"
    }


    fun setRankItem(item: RankItem) {
        _rankItem.postValue(item)
    }


    fun setEditRank(closeness: Int, mgrade: Int) {


        val params: MutableMap<String, Any> = java.util.HashMap()
        params["auth_token"] = Define.VALUES.TOKEN_VALUE
        params["muid"] = GlobalApplication.account.values.muid
        params["f_muid"] = uid
        params["group_type"] = "11"
        params["mode"] = "insert"
        params["closeness"] = rbCloseness[closeness].toString()

        val params2: MutableMap<String, Any> = java.util.HashMap()
        params2["auth_token"] = Define.VALUES.TOKEN_VALUE
        params2["muid"] = GlobalApplication.account.values.muid
        params2["f_muid"] = uid
        params2["group_type"] = "11"
        params2["mode"] = "insert"
        params2["mgrade"] = rbGrade[mgrade].toString()

        addDisposable(
                mainRepository.getTojsonOne("biz_closeness", params, "result")
                        .subscribeOn(Schedulers.io())
                        .zipWith(
                                mainRepository.getTojsonOne("biz_estimate", params2, "result")
                                        .subscribeOn(Schedulers.io()),
                                BiFunction { closeness: String, mgrade: String ->
                                    closeness.toBoolean() && mgrade.toBoolean()
                                }
                        )
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({ it ->
                            it?.let { res ->
                                _check.postValue(res)
                            }
                        }, { error ->
                            logE("error=${error.localizedMessage}")
                        })
        )


    }

    fun putEditRank(closeness: Int, mgrade: Int) {
        rankItem.value?.let {
            if (it.closenessUid!="" && it.mgradeUid != "") {
                val params: MutableMap<String, Any> = java.util.HashMap()
                params["auth_token"] = Define.VALUES.TOKEN_VALUE
                params["uid"] = it.closenessUid
                params["mode"] = "update"
                params["closeness"] = rbCloseness[closeness].toString()

                val params2: MutableMap<String, Any> = java.util.HashMap()
                params2["auth_token"] = Define.VALUES.TOKEN_VALUE
                params2["uid"] = it.mgradeUid
                params2["mode"] = "update"
                params2["mgrade"] = rbGrade[mgrade].toString()

                addDisposable(
                        mainRepository.getTojsonOne("biz_closeness", params, "result")
                                .subscribeOn(Schedulers.io())
                                .zipWith(
                                        mainRepository.getTojsonOne("biz_estimate", params2, "result")
                                                .subscribeOn(Schedulers.io()),
                                        BiFunction { closeness: String, mgrade: String ->
                                            closeness.toBoolean() && mgrade.toBoolean()
                                        }
                                )
                                .observeOn(AndroidSchedulers.mainThread())
                                .subscribe({ it ->
                                    it?.let { res ->
                                        _check.postValue(res)
                                    }
                                }, { error ->
                                    logE("error=${error.localizedMessage}")
                                })
                )
            }else{
                setEditRank(closeness,mgrade)
            }
        }
    }


}