package com.bsni.nameq.v2.view.main.report


import android.content.Intent
import android.graphics.Color
import android.text.Editable
import android.text.TextWatcher
import com.bsni.nameq.R
import com.bsni.nameq.databinding.ActivityCustomerSelectBinding
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.adapters.SpinnerAdapter
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.viewmodel.main.mypage.CustomerSelectActivityViewModel
import kotlinx.android.synthetic.main.activity_customer_select.*
import kotlinx.android.synthetic.main.activity_customer_select.btn_send
import kotlinx.android.synthetic.main.activity_customer_select.et_search
import kotlinx.android.synthetic.main.activity_customer_select.list
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CustomerSelectActivity : ActivityBase<ActivityCustomerSelectBinding, CustomerSelectActivityViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.activity_customer_select

    override val viewModel: CustomerSelectActivityViewModel by viewModel()

    override fun init() {

        tvTitle.text="거래처선택"
        layout_top.setBackgroundColor(Color.WHITE)
        viewModel.getCustomer()
        list.adapter=Adapters(R.layout.item_customer_select, ArrayList())
    }

    override fun initListener() {
        (list.adapter as Adapters).onListClickListener{ _, position ->
            viewModel.item.value?.let {
                val items=it
                items[position].check = !items[position].check
                viewModel.setCustomer(items)
            }
        }

        btn_send.setOnClickListener {

            val selectItems=viewModel.getSelectItems()
            if (selectItems.size > 0){
                val intent=Intent()
                intent.putExtra("items",selectItems)
                setResult(RESULT_OK,intent)
                finish()
            }else{
                showToast("거래처를 선택하세요!")
            }

        }

        et_search.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable) {
                viewModel.getQueryCustomer(s.toString())
            }
        })




    }

    override fun initDatabinding() {

        viewModel.spinnerItems.observe(this,{
            it.let {
                spinner.adapter=SpinnerAdapter(applicationContext,it,R.layout.spinner_item_cardlist,R.layout.spinner_item_cardlist_dropdown)
            }
        })

        viewModel.item.observe(this,{
            it?.let {
                (list.adapter as Adapters).setItems(it)
            }
        })

    }
}
