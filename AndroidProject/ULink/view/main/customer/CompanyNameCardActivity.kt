package com.bsni.nameq.v2.view.main.customer


import android.content.Intent
import android.os.Parcelable
import android.view.View
import android.view.WindowManager
import android.widget.AdapterView
import androidx.core.content.ContextCompat
import androidx.core.view.isVisible
import androidx.recyclerview.widget.DividerItemDecoration
import com.bsni.nameq.R
import com.bsni.nameq.common.Define
import com.bsni.nameq.databinding.ActivityCompanyNameCardBinding
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.util.adapters.AdapterCompany
import com.bsni.nameq.v2.util.adapters.SpinnerAdapter
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.view.main.mynamecard.CardDetailActivity
import com.bsni.nameq.v2.viewmodel.main.customer.CompanyNameCardViewModel
import com.google.android.material.tabs.TabLayout
import kotlinx.android.synthetic.main.activity_company_name_card.*
import kotlinx.android.synthetic.main.tab_layout.view.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CompanyNameCardActivity : ActivityBase<ActivityCompanyNameCardBinding, CompanyNameCardViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.activity_company_name_card

    override val viewModel: CompanyNameCardViewModel by viewModel()

    override fun init() {
        tvTitle.text="회사 통합 명함"
        list_company_card.apply {
            var itemDecoration = DividerItemDecoration(context, DividerItemDecoration.VERTICAL)
            ContextCompat.getDrawable(context, R.drawable.divider)?.let { itemDecoration.setDrawable(it) }
            addItemDecoration(itemDecoration)
        }
        list_company_card.adapter=AdapterCompany(R.layout.item_list_company, ArrayList())
    }

    override fun initListener() {

        btn_search_layout.setOnClickListener {
            viewModel.setSearch()
        }

        btn_search.setOnClickListener {
            viewModel.setEditText(et_search.text.toString())
        }

        tabs.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                viewModel.setTabPostion(tab.position)
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {}
            override fun onTabReselected(tab: TabLayout.Tab?) {}

        })
        spinner.onItemSelectedListener=object :AdapterView.OnItemSelectedListener{
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                viewModel.setSpinnerPostion(position)
            }
            override fun onNothingSelected(parent: AdapterView<*>?) {}
        }
        (list_company_card.adapter as AdapterCompany).onListClickListener { _, position ->
            val nameCard=viewModel.getNameCard(position,tabs.selectedTabPosition)
            nameCard?.let {
                val intent = Intent(applicationContext, CardDetailActivity::class.java)
                intent.putExtra(Define.KEYS.NAME_CARD, it as Parcelable)
                startActivity(intent)
            }?:{
                showToast("정보가 없습니다.")
            }()


        }

        (list_company_card.adapter as AdapterCompany).onPositionCallbackListener {
            when(tabs.selectedTabPosition){
                0->{
                    viewModel.setShared1(it)
                }
                2->{
                    //공유 요청
                    viewModel.setShared3(it)
                }
            }
        }


        swipyrefreshlayout.setOnRefreshListener {
            viewModel.getList()
        }

    }

    override fun initDatabinding() {
        viewModel.tabsItems.observe(this, {
            it?.let {
                val width = (getSystemService(WINDOW_SERVICE) as WindowManager).defaultDisplay.width
                for (i in it.indices) {
                    val tab = tabs.newTab()
                    tabs.addTab(tab)
                    val tabView = layoutInflater.inflate(R.layout.tab_layout, null)
                    tabView.tab_text.text = it[i]

                    tabs.getTabAt(i)!!.customView = tabView
                    tabView.measure(View.MeasureSpec.UNSPECIFIED, View.MeasureSpec.UNSPECIFIED)

                    tabs.getTabAt(i)?.customView?.layoutParams?.width = width / it.size
                }
            }
        })


        viewModel.search.observe(this, {
            it?.let {
                layout_search.isVisible = it
                if (it) {
                    img_search.setImageResource(R.drawable.ic_select)
                } else {
                    img_search.setImageResource(R.drawable.ic_select2)
                }
            }
        })


        viewModel.spinnerItems.observe(this, {
            it.let {
                spinner.adapter = SpinnerAdapter(this, it, R.layout.spinner_item_cardlist, R.layout.spinner_item_cardlist_dropdown)
            }
        })


        viewModel.cncItems.observe(this, {
            swipyrefreshlayout.isRefreshing = false
            (list_company_card.adapter as AdapterCompany).setItems(it, tabs.selectedTabPosition)
        })

        viewModel.csitems.observe(this,{
            it?.let {
                val di=DialogCustom(this, DiglogItem(
                        "공유요청","","","","취소",it
                ))
                var po=0
                di.setOnListItemClickListener { _, position ->
                    di.setItem(DiglogItem("공유신청","명함공유를 신청합니다.","","입력","취소",null))
                    po=position
                }

                di.setOnDismissListener {
                    if (di.check){
                        viewModel.addShared(po)
                    }
                }
            }
        })

        viewModel.msg.observe(this,{
            it?.let {
                showToast(it)
            }
        })
    }
}
