package com.bsni.nameq.v2.view.main.report


import android.app.Activity
import android.content.Context.INPUT_METHOD_SERVICE
import android.content.Context.WINDOW_SERVICE
import android.content.Intent
import android.os.Build
import android.util.Log
import android.view.View
import android.view.WindowManager
import android.view.inputmethod.InputMethodManager
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat
import androidx.core.view.isVisible
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.OnScrollListener
import com.bsni.nameq.R
import com.bsni.nameq.activities.customer.CustomerListActivity
import com.bsni.nameq.common.Define
import com.bsni.nameq.databinding.ActivityReportListFragmentBinding
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.item.ReportItem
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.adapters.SpinnerAdapter
import com.bsni.nameq.v2.util.basic.FragmentBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v3.task.AddTaskActivity
import com.bsni.nameq.v3.task.TaskDetailActivity
import com.bsni.nameq.v3.task.TaskListViewModel
import com.google.android.material.tabs.TabLayout
import kotlinx.android.synthetic.main.activity_report_list_fragment.*
import kotlinx.android.synthetic.main.tab_layout.view.*
import org.koin.androidx.viewmodel.ext.android.viewModel


class TaskListFragment : FragmentBase<ActivityReportListFragmentBinding, TaskListViewModel>() {
    val TAG = "TaskListFragment"
    override val layoutResourceId: Int
        get() = R.layout.activity_report_list_fragment

    override val viewModel: TaskListViewModel by viewModel()

    companion object {
        const val REQUEST_ADD_REPORT = 110
    }

    override fun init() {
        repo_list.apply {
            var itemDecoration = DividerItemDecoration(this.context, DividerItemDecoration.VERTICAL)
            context?.let { ContextCompat.getDrawable(it, R.drawable.divider)?.let { itemDecoration.setDrawable(it) } }
            addItemDecoration(itemDecoration)
        }
        repo_list.adapter=Adapters(R.layout.item_report2, ArrayList<ReportItem>())
//        repo_list.addItemDecoration(DividerItemDecoration(context, LinearLayoutManager.VERTICAL))

    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun initListener() {

        btn_search.setOnClickListener {
            viewModel.checkSearch()
        }

        tabs.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
//                viewModel.getReport(et_search.text.toString(), tab!!.position)
                viewModel.setOwner(et_search.text.toString(), tab.position)

            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {}
            override fun onTabReselected(tab: TabLayout.Tab?) {}
        })

        swipeContainer.setOnRefreshListener {
            viewModel.setOwner(et_search.text.toString(), tabs.selectedTabPosition)
        }




        btn_search_send.setOnClickListener {
            viewModel.setOwner(et_search.text.toString(), tabs.selectedTabPosition)
            val imm = context?.getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
            imm.hideSoftInputFromWindow(et_search.windowToken, 0);
        }

        fbMain.setOnClickListener {
//            val intent = Intent(context, WriteReportActivity::class.java)
            val intent = Intent(context, AddTaskActivity::class.java)
            startActivityForResult(intent,REQUEST_ADD_REPORT)
        }

        (repo_list.adapter as Adapters).onListClickListener { _, position ->
            viewModel.reportItem.value?.let {
                val intent = Intent(context, TaskDetailActivity::class.java)
                intent.putExtra(Define.KEYS.UID, it[position].sharedContentUid)
                startActivity(intent)
            }
        }
        (repo_list).addOnScrollListener(object : OnScrollListener() {
            override fun onScrollStateChanged(recyclerView: RecyclerView, newState: Int) {
                super.onScrollStateChanged(recyclerView, newState)
                Log.d(TAG, "onScrollStateChanged: ${newState}")
                if(newState==1) {
                    val imm = context?.getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
                    imm.hideSoftInputFromWindow(
                        et_search.windowToken,
                        InputMethodManager.HIDE_NOT_ALWAYS
                    )
                }
            }
            override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {
                super.onScrolled(recyclerView, dx, dy)
                Log.d(TAG, "onScrolled: ")
            }
        })
           (repo_list).setOnScrollChangeListener { v, scrollX, scrollY, oldScrollX, oldScrollY ->
            if (!repo_list.canScrollVertically(1)){
              //  if (!swipeContainer.isRefreshing){
                Log.d(TAG, "initListener: 추가로드!!" + "v-> $v , scrollY-> $scrollY , oldScrollY-> $oldScrollY")
               if(oldScrollY<0 && !viewModel.onaddprogress.value!!) viewModel.addReport(et_search.text.toString())
            }
          //  }

        }


        (repo_list.adapter as Adapters).onPositionCallbackListener { po->
            val di= DialogCustom(context!!,
                    DiglogItem(
                            "업무 보고 삭제",
                            "업무보고를 삭제하시겠습니까?",
                            "", "삭제"
                    )
            )
            di.setOnDismissListener {
                if (di.check){
                    viewModel.delReport(po)
                }
            }
        }


    }



    override fun initLiveData() {
        val imm = context?.getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
        viewModel.tabsItems.observe(this, Observer {
            it?.let {
                val width = (context?.getSystemService(WINDOW_SERVICE) as WindowManager).defaultDisplay.width
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

        viewModel.isSearch.observe(this, Observer {
            it?.let {
                if (it) {
                    et_search.requestFocus()
                    img_search.setImageResource(R.drawable.ic_select)
                    imm.showSoftInput(et_search, InputMethodManager.SHOW_IMPLICIT)
                } else {
                    img_search.setImageResource(R.drawable.ic_select2)
                    et_search.setText("")
                    imm.hideSoftInputFromWindow(et_search.windowToken, 0);
                }
                layout_search.isVisible = it
            }
        })

        viewModel.spinnerItems.observe(this, Observer {
            it?.let {
                spinner.adapter = context?.let { it1 -> SpinnerAdapter(it1, ArrayList(it.keys), R.layout.spinner_item_cardlist, R.layout.spinner_item_cardlist_dropdown) }
            }
        })

        viewModel.reportItem.observe(this, Observer {
            swipeContainer.isRefreshing = false
            (repo_list.adapter as Adapters).setItems(it)
        })

    }

    override fun onResume() {
        super.onResume()
        viewModel.setOwner(et_search.text.toString(), tabs.selectedTabPosition)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        logD("requestCode=${requestCode} resultCode=${resultCode}")
        if (REQUEST_ADD_REPORT==requestCode && resultCode==Activity.RESULT_OK){
            viewModel.page=0
            viewModel.getReport(et_search.text.toString())
        }

    }


}
