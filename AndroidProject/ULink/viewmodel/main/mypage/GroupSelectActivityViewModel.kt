package com.bsni.nameq.v2.viewmodel.main.mypage

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.models.database.Group
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.item.GroupCompanyItem
import com.bsni.nameq.v2.item.ResultItem

import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers

class GroupSelectActivityViewModel(private val repository: Repository,private val dbHelper: DBHelper) : ViewModelBasic() {

    private var _groupItems = MutableLiveData<ArrayList<Group>>()
    val groupItems: LiveData<ArrayList<Group>>
        get() = _groupItems

    private var _groupCompanyItems = MutableLiveData<ArrayList<GroupCompanyItem>>()
    val groupCompanyItems: LiveData<ArrayList<GroupCompanyItem>>
        get() = _groupCompanyItems

    private var _isEdit = MutableLiveData<Boolean>(false)
    val isEdit: LiveData<Boolean>
        get() = _isEdit

    private var _type = MutableLiveData<Boolean>()
    val type: LiveData<Boolean>
        get() = _type

    var groupCompanyItem:GroupCompanyItem?=null

    fun isEdit(){
        val isEditing=!isEdit.value!!
        for (item in groupCompanyItems.value!!){
            item.isEditing=isEditing
        }
        _isEdit.postValue(isEditing)
    }

    fun getGroup(){
        _groupItems.postValue(dbHelper.selectGroups())
    }

    fun setType(type:Boolean){
        _type.postValue(type)
    }


    fun getCompanyGroup(){
        var data=HashMap<String, Any>()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["muid"] = GlobalApplication.account.values.muid
        data["buid"] = -1
        data["group_type"] = 2    //(0:내부조직, 1:외부조직, 2:개인/그룹)
        data["mode"] = "group_list"

        addDisposable(
                repository.getTojson("cgrouping/", data, GroupCompanyItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            it?.let {
                                val arrayList=ArrayList<GroupCompanyItem>()
                                arrayList.add(GroupCompanyItem("0","-1","","전체"))
                                arrayList.addAll(it)
                                _groupCompanyItems.postValue(arrayList)
                            }

                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }

    fun addCompanyGroup(name:String){
        var data=HashMap<String, Any>()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["muid"] = GlobalApplication.account.values.muid
        data["buid"] = -1
        data["group_name"] = name
        data["group_type"] = 2    //(0:내부조직, 1:외부조직, 2:개인/그룹)
        data["mode"] = "insert_group"

        addDisposable(
                repository.getTojsonObj("cgrouping/", data, ResultItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                           if (it.result){
                               getCompanyGroup()
                           }
                            _msg.postValue(it.msg)
                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }


    fun putCompanyGroup(po:GroupCompanyItem){
//        var data=HashMap<String, Any>()
//        data["auth_token"] = Define.VALUES.TOKEN_VALUE
//        data["muid"] = App.account.values.muid
//        data["buid"] = -1
//        data["group_name"] = name
//        data["group_type"] = 2    //(0:내부조직, 1:외부조직, 2:개인/그룹)
//        data["mode"] = "insert_group"
//
//        addDisposable(
//                repository.getTojsonObj("cgrouping/", data, ResultItem::class.java)
//                        .subscribeOn(Schedulers.io())
//                        .observeOn(AndroidSchedulers.mainThread())
//                        .subscribe({
//                            if (it.result){
//                                getCompanyGroup()
//                            }
//                            _msg.postValue(it.msg)
//                              _isEdit.postValue(false)
//                        }, {
//                            logE("error=${it.localizedMessage}")
//                        })
//        )
    }


    fun delCompanyGroup(po:GroupCompanyItem){
        var data=HashMap<String, Any>()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["muid"] = GlobalApplication.account.values.muid
        data["buid"] = 0
        data["ocuid"] = po.ocuid
        data["mode"] = "delete_group"

        addDisposable(
                repository.getTojsonObj("cgrouping/", data, ResultItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            if (it.result){
                                getCompanyGroup()
                            }
                            _msg.postValue(it.msg)
                            _isEdit.postValue(false)
                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }


    fun addGroupCompanyMember(namecards:ArrayList<NameCard>){
        var fmuids=""
        for(item in namecards){
            fmuids+="${item.uid},"
        }
        if (fmuids==""){
            _msg.postValue("선택된 사람이 없습니다.")
            return
        }else{
            fmuids=fmuids.dropLast(1)
        }

        groupCompanyItem?.let {
            var data=HashMap<String, Any>()
            data["auth_token"] = Define.VALUES.TOKEN_VALUE
            data["muid"] = GlobalApplication.account.values.muid
            data["buid"] = -1
            data["ocuid"] = it.ocuid
            data["fmuids"] = fmuids
            data["group_type"] = 2          //(0:내부조직, 1:외부조직, 2:개인/그룹)
            data["mode"] = "insert_incl"

            addDisposable(
                    repository.getTojsonObj("cgrouping/", data, ResultItem::class.java)
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe({result->
                                if (result.result){
                                    //getCompanyGroup()
                                }
                                _msg.postValue(result.msg)
                                _isEdit.postValue(false)
                            }, {
                                logE("error=${it.localizedMessage}")
                            })
            )
        }


    }

}
