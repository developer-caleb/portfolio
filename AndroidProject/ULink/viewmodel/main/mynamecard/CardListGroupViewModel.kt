package com.bsni.nameq.v2.viewmodel.main.mynamecard

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.DBHelper
import com.bsni.nameq.common.Define
import com.bsni.nameq.models.database.Group
import com.bsni.nameq.models.database.GroupCard
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.item.ResultItem
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers

class CardListGroupViewModel(private val repository: Repository, private val dbHelper: DBHelper):ViewModelBasic() {

    private var _isEdit = MutableLiveData<Boolean>(false)
    val isEdit: LiveData<Boolean>get() = _isEdit

    private var _isEnd = MutableLiveData<Boolean>(false)
    val isEnd: LiveData<Boolean>get() = _isEnd

    var type = TYPE.NONE

    enum class TYPE{NONE,SELECT}
    var items = ArrayList<NameCard>()


    private var _groupItems = MutableLiveData<ArrayList<Group>>(ArrayList())
    val groupItems: LiveData<ArrayList<Group>>get() = _groupItems




    fun isEdit(){
        val isEditing=!isEdit.value!!
        for (item in groupItems.value!!){
            item.isEditing=isEditing
        }
        _isEdit.postValue(isEditing)
    }

    fun getGroupList(){
        val tempArray=ArrayList<Group>()
        if (type==TYPE.NONE){
            tempArray.add(Group(0,0,"전체"))
            tempArray.add(Group(0,10,"Link명함"))
            tempArray.add(Group(0,11,"촬영명함"))
            tempArray.add(Group(0,0,"주요인맥"))
            tempArray.add(Group(0,0,"친한인맥"))
        }
        tempArray.addAll(dbHelper.selectGroups())

        val isEditing=isEdit.value!!
        for (item in tempArray){
            item.isEditing=isEditing
        }

        _groupItems.postValue(tempArray)

    }

    fun addGroupNameCard(group: Group){
        var data=HashMap<String,Any>()
        data["muid"] = GlobalApplication.account.values.muid.toString()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["muid"] = GlobalApplication.account.values.muid
        data["fmuid"] = getGroupIdx()
        data["group_uid"] = group.uid


        addDisposable(
                repository.getTojsonObj("v3/cardbooks/group/add",data, ResultItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({

                            if (it.result){
                                val groupCard=ArrayList<GroupCard>()
                                for (item in items){
                                    groupCard.add(GroupCard(item.uid,group.uid,item.type))
                                }
                                //todo 내장 디비에 넣기
                                if (groupCard.size>0){
//                                    dbHelper.insertGroupCards(groupCard)
                                }
                                _isEnd.postValue(true)

                            }

                            _msg.postValue(it.msg)



                        },{
                            logE("error=${it.localizedMessage}")
                        })
        )
    }

    fun getGroupIdx():String{
        var str=""
        for (item in items){
            if(item.type==10){
                str+="${item.uid},"
            }else if (item.type == 11){
                str+="u${item.uid},"
            }
        }
        if (items.size>0){
            str=str.dropLast(1)
        }

        return str
    }



    fun addGroupItem(str:String){
        logD("addGroupItem_str=${str}")

        var data=HashMap<String,Any>()
        data["muid"] = GlobalApplication.account.values.muid.toString()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["mode"] = "insert"
        data["name"] = str
        data["type"] = "10"

        addDisposable(
                repository.getTojsonOne("group",data, "group_uid")
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            dbHelper.insertGroup(Group(it.toInt(),10,str))
                            getGroupList()
                        },{
                            logE("error=${it.localizedMessage}")
                        })
        )
    }

    fun putGroupItem(po:Int,name:String){

        val item=groupItems.value!![po]
        item.name=name
        var data=HashMap<String,Any>()
        data["muid"] = GlobalApplication.account.values.muid.toString()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["mode"] = "update"
        data["uid"] = item.uid.toString()
        data["name"] = item.name
        data["type"] = "10"

        addDisposable(
                repository.getTojsonOne("group",data, "result")
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            dbHelper.updateGroup(item)
                            getGroupList()
                        },{
                            logE("error=${it.localizedMessage}")
                        })
        )
    }

    fun delGroupItem(po:Int){


        var data=HashMap<String,Any>()
        data["muid"] = GlobalApplication.account.values.muid.toString()
        data["auth_token"] = Define.VALUES.TOKEN_VALUE
        data["mode"] = "delete"
        data["uid"] = groupItems.value!![po].uid.toString()
        data["type"] = "10"

        addDisposable(
                repository.getTojsonOne("group",data, "result")
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            dbHelper.deleteGroup(groupItems.value!![po])
                            getGroupList()
                        },{
                            logE("error=${it.localizedMessage}")
                        })
        )
    }




}