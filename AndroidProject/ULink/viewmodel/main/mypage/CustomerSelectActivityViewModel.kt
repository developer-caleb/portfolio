package com.bsni.nameq.v2.viewmodel.main.mypage

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.Define
import com.bsni.nameq.v2.item.CustomerItem
import com.bsni.nameq.v2.util.async.Repository
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import com.bsni.nameq.v2.util.common.logE
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers

class CustomerSelectActivityViewModel(private val repository: Repository) : ViewModelBasic() {
    //private var TAG= "CustomerSelectActivityViewModel"
    private val _items=MutableLiveData<ArrayList<CustomerItem>>(ArrayList())
    private var preitem=ArrayList<CustomerItem>()
    val item:LiveData<ArrayList<CustomerItem>>
        get() = _items


    private val _spinnerItems=MutableLiveData<ArrayList<String>>(ArrayList())
    val spinnerItems:LiveData<ArrayList<String>>
        get() = _spinnerItems


    init {
        val spitems=ArrayList<String>()
        spitems.add("등록일순")
        spitems.add("이름순")
        spitems.add("회사순")
        _spinnerItems.postValue(spitems)
    }

    fun setCustomer(customerItems: ArrayList<CustomerItem>){
        _items.postValue(customerItems)
    }

    fun getSelectItems():ArrayList<CustomerItem>{
        val arr=ArrayList<CustomerItem>()
        item.value?.let {
            for (item in it){
                if (item.check){
                    arr.add(item)
                }
            }
        }
        return arr
    }

    fun getCustomer(){
        var param=HashMap<String,Any>()
        param["auth_token"]= Define.VALUES.TOKEN_VALUE
        param["buid"]= GlobalApplication.account.values.buid
        param["muid"]= GlobalApplication.account.values.muid


        addDisposable(
                repository.getTojson("v3/customer/list1",param,CustomerItem::class.java)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe({
                            it?.let {
                                preitem = ArrayList<CustomerItem>()
                                preitem.addAll(it)
                                _items.postValue(it)
                                Log.d(TAG, "getCustomer: prenameCardItems"+preitem.toString())
                                Log.d(TAG, "getCustomer: _nameCardItems"+_items.toString())
                            }
                        }, {
                            logE("error=${it.localizedMessage}")
                        })
        )
    }
    fun getQueryCustomer(string: String){
        if(string.equals("")){
           // _prenameCardItems.postValue(dbHelper.selectCards("signdate"))
            _items.postValue(preitem)
        }else {
            val arr = ArrayList<CustomerItem>()
            preitem?.let {
                for (item in it) if (string in item.company || string in item.name) arr.add(item)
            };
            Log.d(TAG, "getQueryCustomer: query=>" + string)
            Log.d(TAG, "getQueryCustomer: " + arr.toString())
            arr.sortBy { it.name}
            _items.postValue(arr)
        }
    }

}
