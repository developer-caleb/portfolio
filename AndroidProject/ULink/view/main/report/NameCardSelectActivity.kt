package com.bsni.nameq.v2.view.main.report


import android.content.Intent
import android.graphics.Color
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import androidx.core.view.isVisible
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.bsni.nameq.R
import com.bsni.nameq.databinding.ActivityNameCardSelectBinding
import com.bsni.nameq.v2.item.CustomerItem
import com.bsni.nameq.v2.item.GroupCompanyItem
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import kotlinx.android.synthetic.main.activity_card_search.*
import kotlinx.android.synthetic.main.activity_name_card_select.*
import kotlinx.android.synthetic.main.activity_name_card_select.btn_send
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class NameCardSelectActivity : ActivityBase<ActivityNameCardSelectBinding, NameCardSelectViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.activity_name_card_select

    override val viewModel: NameCardSelectViewModel by viewModel()

    override fun init() {
        tvTitle.text="명함첩"
        layout_top.setBackgroundColor(Color.WHITE)
//        if (intent.hasExtra("group_idx")) {
//            val groupIdx = intent.getIntExtra("group_idx", 0)
//            if (groupIdx > 0) {
//                viewModel.getNameCards(groupIdx)
//            } else {
//                viewModel.getNameCards()
//            }
//        }else if (intent.hasExtra("customer_item")){
//            val item=intent.getSerializableExtra("customer_item") as CustomerItem
//            //val cmpCd = intent.getIntExtra("cmp_cd", 0)
//
////            logD("item=${item.name}")
////            logD("item_cmp_cd=${item.cmp_cd}")
////            logD("item=${item.company}")
////            logD("item=${item.muid}")
////            logD("item=${item.type}")
////            logD("item=${item.favorite}")
//
//            if (item.cmp_cd != -1) {
//                viewModel.getNameCardsToCmpCd(item.cmp_cd)
//            } else {
//                viewModel.getNameCardsToCompany(item.company)
//            }
//        }else if (intent.hasExtra("ocuid")){
//            val groupIdx = intent.getIntExtra("ocuid", -1)
//            viewModel.getCompanyNameCards(groupIdx)
//
//        }else{
//            viewModel.getNameCards()
//        }
        if (intent.hasExtra("group_idx")) {
            val groupIdx = intent.getIntExtra("group_idx", 0)
            if (groupIdx > 0) {
                viewModel.getNameCards(groupIdx)
            } else {
                viewModel.getNameCards()
            }
        }else if (intent.hasExtra("company")){
            val company = intent.getStringExtra("company");
            logD("init() -> company : $company")
            if (!company.isNullOrEmpty()) {
                viewModel.getNameCardsToCompany(company)
            }
        }else if (intent.hasExtra("cmp_cd")){
            val cmpCd = intent.getIntExtra("cmp_cd", 0)
            logD("init() -> cmpCd : $cmpCd")
            if (cmpCd > 0) {
                viewModel.getNameCardsToCmpCd(cmpCd)
            }
        }else if (intent.hasExtra("ocuid")){
            val groupIdx = intent.getIntExtra("ocuid", -1)
            viewModel.getCompanyNameCards(groupIdx)

        }else{
            viewModel.getNameCards()
        }

        list.adapter=Adapters(R.layout.item_name_card_select,ArrayList())
        list.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))


    }

    override fun initListener() {
        btn_search.setOnClickListener {
            viewModel.setSerch()
        }
        (list.adapter as Adapters).onListClickListener { _, position ->
            viewModel.setCheck(position)
        }
        cb_select.setOnCheckedChangeListener { _, isChecked ->
            viewModel.setCheckAll(isChecked)
        }

        btn_send.setOnClickListener {

            val arr=viewModel.getSelect()
            if (arr.size>0){
                val intent=Intent()
                intent.putExtra("items",arr)
                setResult(RESULT_OK,intent)
                finish()
            }else{
                showToast("명함첩을 선택하세요.")
            }

        }

        et_search.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable) {
                viewModel.getqueryNameCards(s.toString())
               /* if(s.isNotEmpty()){
                    //btn_send.visibility= View.VISIBLE
                    viewModel.getqueryNameCards(s.toString())
                }else{
                    viewModel.getqueryNameCards(s.toString())
                    //btn_send.visibility= View.GONE
                }*/
            }
        })


    }

    override fun initDatabinding() {
        viewModel.isSerch.observe(this,{
            it?.let {
                if(it){
                    img_search.setImageResource(R.drawable.ic_select2)
                }else{
                    img_search.setImageResource(R.drawable.ic_select)
                }
                layout_search.isVisible=it
            }
        })
        viewModel.nameCardItems.observe(this,{
            it?.let {
                (list.adapter as Adapters).setItems(it)
            }
        })

    }
}
