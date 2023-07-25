package com.bsni.nameq.v2.view.main.report


import android.content.Intent
import android.database.Cursor
import android.graphics.Bitmap
import android.net.Uri
import android.os.Environment
import android.provider.MediaStore
import android.provider.OpenableColumns
import android.view.View
import android.widget.LinearLayout
import androidx.core.view.isVisible
import androidx.lifecycle.Observer
import com.bsni.nameq.R
import com.bsni.nameq.common.*
import com.bsni.nameq.databinding.ActivityAddReportBinding
import com.bsni.nameq.interfaces.ApiService
import com.bsni.nameq.models.api.Expense
import com.bsni.nameq.models.api.Person
import com.bsni.nameq.models.api.ReportDetail2
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.objects.ApiResult
import com.bsni.nameq.v2.item.CustomerItem
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.adapters.RecyclerDecoration
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.util.common.logE
import com.bsni.nameq.v3.task.AddTaskActivityViewModel
import com.bumptech.glide.Glide
import com.bumptech.glide.load.engine.DiskCacheStrategy
import com.google.android.material.bottomsheet.BottomSheetBehavior
import kotlinx.android.synthetic.main.activity_add_report.*
import kotlinx.android.synthetic.main.bottmo_report_date.*
import kotlinx.android.synthetic.main.top_layout.*
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.MultipartBody
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.asRequestBody
import org.koin.androidx.viewmodel.ext.android.viewModel
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList


class AddReportActivity : ActivityBase<ActivityAddReportBinding, AddTaskActivityViewModel>() {
    val TAG = "AddReportActivity"
    override val layoutResourceId: Int
        get() = R.layout.activity_add_report

    override val viewModel: AddTaskActivityViewModel by viewModel()

    private lateinit var bottomSheetBehavior: BottomSheetBehavior<LinearLayout>

    companion object {
        const val REQUEST_SELECT_CUSTOMERS = 110
        const val REQUEST_SELECT_TASK = 111
        const val REQUEST_SELECT_SHARE_MEMBER = 112
        const val FILE_REQUEST = 116
        const val FILE1 = 1
        const val FILE2 = 2
        const val FILE3 = 3
    }

    var indexImage=FILE1
    private var image1 = ""
    private var image2 = ""
    private var image3 = ""

    override fun init() {
        if (intent.hasExtra("report")) {
            tvTitle.text = "업무수정"
            viewModel.setReportDetail(intent.getSerializableExtra("report") as ReportDetail2)
        } else {
            tvTitle.text = "업무작성"
        }


        bottomSheetBehavior = BottomSheetBehavior.from(bottom_sheet_layout as LinearLayout)

        val itemDecoration = RecyclerDecoration(12)
        list_customers.adapter = Adapters(R.layout.item_add_report, ArrayList())

        list_attendee.adapter = Adapters(R.layout.item_add_report2, ArrayList())
        list_attendee.addItemDecoration(itemDecoration)
        list_share.adapter = Adapters(R.layout.item_add_report2, ArrayList())
        list_share.addItemDecoration(itemDecoration)


    }

    override fun initListener() {

        img_date.setOnClickListener {
            bottomSheet(SHEET.ON)
        }

        btn_company.setOnClickListener {
//            val intent = Intent(this, SelectionListActivity::class.java)
            val intent = Intent(this, CustomerSelectActivity::class.java)
            startActivityForResult(intent, REQUEST_SELECT_CUSTOMERS)
        }


        rb_share_card.setOnClickListener {
//            intent = Intent(this, SelectFromNameCardActivity::class.java)
//            startActivityForResult(intent, REQUEST_SELECT_PARTICIPANTS)
            getNameCard(REQUEST_SELECT_SHARE_MEMBER)
        }

        rb_share_group.setOnClickListener {
            getGroup(REQUEST_SELECT_SHARE_MEMBER)
        }


        rb_task_card.setOnClickListener {
//            intent = Intent(this, SelectFromNameCardActivity::class.java)
//            intent.putExtra(Define.KEYS.IS_LIVE_CARD_ONLY, true)
//            startActivityForResult(intent, REQUEST_SELECT_SHARE_MEMBER)
            getNameCard(REQUEST_SELECT_TASK)
        }

        rb_task_group.setOnClickListener {
            getGroup(REQUEST_SELECT_TASK)
        }


        btn_send.setOnClickListener {

            if (viewModel.shareItems.value.isNullOrEmpty() || viewModel.shareItems.value?.size ==0){
                showToast("공유자를 선택하세요")
                return@setOnClickListener
            }

            if (etDescription.text.isEmpty()){
                showToast("업무작성을 입력하세요")
                return@setOnClickListener
            }

            viewModel.reportDetail.value?.let {
                //수정
                //updateReport(it)
                //updateReport2(it)
            } ?: {
                //입력
                addReport()
                //addReport2()

            }()


//            expense.image1 = if (uploadedImages.size >= 1) uploadedImages.get(0) else ""
//            expense.image2 = if (uploadedImages.size >= 2) uploadedImages.get(1) else ""
//            expense.image3 = if (uploadedImages.size >= 3) uploadedImages.get(2) else ""
        }

        bottomSheetBehavior.addBottomSheetCallback(object : BottomSheetBehavior.BottomSheetCallback() {
            override fun onSlide(bottomSheet: View, slideOffset: Float) {}
            override fun onStateChanged(bottomSheet: View, newState: Int) {
                if (newState == BottomSheetBehavior.STATE_COLLAPSED) {
                    bottomSheet(SHEET.OFF)
                }
            }
        })

        (list_customers.adapter as Adapters).onListClickListener { _, position ->
            viewModel.delCustomes(position)
        }

        (list_attendee.adapter as Adapters).onListClickListener { _, position ->
            viewModel.delTask(position)
        }

        (list_share.adapter as Adapters).onListClickListener { _, position ->
            viewModel.delShare(position)
        }

        background.setOnClickListener {}

        btn_img_cancel.setOnClickListener {
            bottomSheet(SHEET.OFF)
        }

        btn_cancel.setOnClickListener {
            bottomSheet(SHEET.OFF)
        }


        calendarView.setOnDateChangeListener { _, year, month, dayOfMonth ->
            val c = Calendar.getInstance()
            c.set(year, month, dayOfMonth)
            viewModel.setDate(c.time)

        }

        add_file.setOnClickListener {


            if (StringUtil.isNotEmpty(image1) &&StringUtil.isNotEmpty(image2) && StringUtil.isNotEmpty(image3)) {
                showToast("3장까지만 등록가능합니다.")
                return@setOnClickListener
            }

            indexImage = if (StringUtil.isEmpty(image1)) {
                FILE1
            }else if (StringUtil.isEmpty(image2)) {
                FILE2
            }else {
                FILE3
            }
            val intent = Intent(Intent.ACTION_GET_CONTENT)
            intent.type = "*/*"
            startActivityForResult(intent, FILE_REQUEST)
        }
    }

    //나비서 내용
    private fun addReport() {
        val expense = Expense()
        expense.buid = GlobalApplication.account.values.buid
        expense.muid = GlobalApplication.account.values.muid

        expense.customers = ""
        val customerItem = viewModel.customerItems.value
        customerItem?.let {
            for (item in it) {
                expense.customers += item.company + ","
            }
        }
        expense.customers=expense.customers.dropLast(1)

        val participants = ArrayList<Person>()
        val takeitems = viewModel.attendeeItems.value
        takeitems?.let {
            for (item in it) {
                participants.add(Person(item))
            }
        }
        for (item in participants) {
            logD("participants=${item.name}")
        }

        expense.expensePersons = participants
        expense.expenseList = 0


        val shareMember = ArrayList<Person>()
        val shareitems = viewModel.shareItems.value
        shareitems?.let {
            for (item in it) {
                shareMember.add(Person(item))
            }
        }
        for (item in shareMember) {
            logD("share=${item.name}")
        }

        expense.sharedMuid = shareMember
        logD( "addReport: ${expense.sharedMuid}")
        expense.title = et_title.text.toString()
        expense.description = etDescription.text.toString()
        var date = Date()
        viewModel.date.value?.let {
            date = it
        }
        expense.expenseDate = SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date)
        expense.image1 = image1
        expense.image2 = image2
        expense.image3 = image3
        //viewModel.addReport(expense)

//        viewModel.writeReport(expense)!!.observe(this, { result: ApiResponse<*>? ->
//            if (result!!.result) {
//                setResult(RESULT_OK)
//                finish()
//            } else {
//                showToast(result!!.message)
//            }
//        })


        // 2020-11-29 공유자 메모 작성

        var shareMuids = ""
        for (item in participants) {
            logD("participants=${item.name}")
            if (item.group_type == 11) {
                shareMuids+= String.format("u%d,", item.muid)
            } else {
                shareMuids+= String.format("%d,", item.muid)
            }
        }

        if (!shareMuids.isEmpty()) {
            shareMuids.dropLast(1);
        }
        val sharedMuids = expense.sharedMuid.dropLast(1);
        val params: MutableMap<String, Any> = HashMap()
        params["auth_token"] = Define.VALUES.TOKEN_VALUE
        params["muid"] = GlobalApplication.account.values.muid
        params["buid"] = GlobalApplication.account.values.buid
        params["customers"] = expense.customers
        params["participants"] = shareMuids
        params["recipients"] = sharedMuids

        viewModel.addMemo(params)
    }

    private fun addReport2() {
        val expense = Expense()
        expense.buid = GlobalApplication.account.values.buid
        expense.muid = GlobalApplication.account.values.muid

        expense.customers = ""
        val customerItem = viewModel.customerItems.value
        customerItem?.let {
            for (item in it) {
                expense.customers += item.company + ","
            }
        }
        expense.customers=expense.customers.dropLast(1)

        val participants = ArrayList<Person>()
        val takeitems = viewModel.attendeeItems.value
        takeitems?.let {
            for (item in it) {
                participants.add(Person(item))
            }
        }
        for (item in participants) {
            logD("participants=${item.name}")
        }

        expense.expensePersons = participants
        expense.expenseList = 0


        val shareMember = ArrayList<Person>()
        val shareitems = viewModel.shareItems.value
        shareitems?.let {
            for (item in it) {
                shareMember.add(Person(item))
            }
        }
        for (item in shareMember) {
            logD("share=${item.name}")
        }

        expense.sharedMuid = shareMember
        logD( "addReport: ${expense.sharedMuid}")
        expense.title = et_title.text.toString()
        expense.description = etDescription.text.toString()
        var date = Date()
        viewModel.date.value?.let {
            date = it
        }
        expense.expenseDate = SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date)
        expense.image1 = image1
        expense.image2 = image2
        expense.image3 = image3
        //viewModel.addReport(expense)

//        viewModel.writeReport(expense)!!.observe(this, { result: ApiResponse<*>? ->
//            if (result!!.result) {
//                setResult(RESULT_OK)
//                finish()
//            } else {
//                showToast(result!!.message)
//            }
//        })


        // 2020-11-29 공유자 메모 작성

        var shareMuids = ""
        for (item in participants) {
            logD("participants=${item.name}")
            if (item.group_type == 11) {
                shareMuids+= String.format("u%d,", item.muid)
            } else {
                shareMuids+= String.format("%d,", item.muid)
            }
        }

        if (!shareMuids.isEmpty()) {
            shareMuids.dropLast(1);
        }
        val sharedMuids = expense.sharedMuid.dropLast(1);
        val params: MutableMap<String, Any> = HashMap()
        params["auth_token"] = Define.VALUES.TOKEN_VALUE
        params["muid"] = GlobalApplication.account.values.muid
        params["buid"] = GlobalApplication.account.values.buid
        params["customers"] = expense.customers
        params["participants"] = shareMuids
        params["recipients"] = sharedMuids

        viewModel.addMemo(params)
    }




   /* private fun updateReport2(item: ReportDetail2) {
        Log.d(TAG, "updateReport2: 수정시작")
        val auth_token = Define.VALUES.TOKEN_VALUE;
        val params = HashMap<String, Any>()
        //params[Define.KEYS.AUTH_TOKEN] = Define.VALUES.TOKEN_VALUE
        params[Define.KEYS.UID] = item.report.uid
        params[Define.KEYS.TYPE] = if (item.report.type) 1 else 0
        params[Define.KEYS.MODE] = "update3"

        params[ReportRepository.KEY_EXPENSE_TYPE] = if (item.report.expenseType) 1 else 0
        var expenseDate: String = item.report.expenseDate.replace("T", " ")
        expenseDate = expenseDate.substring(0, expenseDate.indexOf('.'))
        params[ReportRepository.KEY_EXPENSE_DATE] = expenseDate

        val participants = ArrayList<Person>()
        viewModel.taskItems.value?.let {
            for (item in it) {
                participants.add(Person(item))
            }
        }
        val shareMember = ArrayList<Person>()
        viewModel.shareItems.value?.let {
            for (item in it) {
                shareMember.add(Person(item))
            }
        }


        params[ReportRepository.KEY_EXPENSE_PERSON] = getPeople(participants)
        params[ReportRepository.KEY_SHARED_PERSON] = getPeople(shareMember)
        params[ReportRepository.KEY_CONT_TITLE] = et_title.text.toString()
        params[Define.KEYS.DESCRIPTION] = etDescription.text.toString()
        params[ReportRepository.KEY_EXPENSE] = "0"
        params[ReportRepository.KEY_EXPENSE_LIST] = 0
        params[ReportRepository.KEY_STEP] = if (item.report.step) 1 else 0
        params[ReportRepository.KEY_SALES_ACCOUNT] = "0"
        params[Define.KEYS.IMAGE1] = ""
        params[Define.KEYS.IMAGE2] = ""
        params[Define.KEYS.IMAGE3] = ""
//        params[Define.KEYS.IMAGE3] = if (uploadedImages.size >= 3) uploadedImages.get(2) else ""
        params[ReportRepository.KEY_FILE1] = if (StringUtil.isNotEmpty(item.report.file1)) item.report.file1 else ""
        params[ReportRepository.KEY_FILE2] = if (StringUtil.isNotEmpty(item.report.file2)) item.report.file2 else ""
        params[ReportRepository.KEY_FILE3] = if (StringUtil.isNotEmpty(item.report.file3)) item.report.file3 else ""
        params[ReportRepository.KEY_FILE_NAME1] = if (StringUtil.isNotEmpty(item.report.fileName1)) item.report.fileName1 else ""
        params[ReportRepository.KEY_FILE_NAME2] = if (StringUtil.isNotEmpty(item.report.fileName2)) item.report.fileName2 else ""
        params[ReportRepository.KEY_FILE_NAME3] = if (StringUtil.isNotEmpty(item.report.fileName3)) item.report.fileName3 else ""


        viewModel.modifyReport(params).observe(this, Observer { result: ApiResult ->
            if (result.result) {
                Log.d(TAG, "updateReport: ")
                //공유자 변경

                //공유자 변경 todo <== 중복됨 더 들어감 확인 안하는듯
//                val list: MutableList<Person> = java.util.ArrayList()
//                for (person in shareMember) {
//                    var isDuplicated = false
//                    for (sharer in item.sharers) {
//                        if (sharer.targetMuid === person.muid) {
//                            isDuplicated = true
//                            break
//                        }
//                    }
//                    if (!isDuplicated) list.add(person)
//                }
//                viewModel.updateShareMember(item.report.uid, list).observe(this, { response: ApiResult ->
//                    if (response.result)
//                        logD(response.msg)
//                })

//                val customers=ArrayList<String>()
//                viewModel.customerItems.value?.let {
//                    for (item in it){
//                        customers.add(item.company)
//                    }
//                }

                //거래처 수정 todo <== 내용에 ### 이름만 넣음
//                viewModel.updateCustomer(item.report.uid, customers).observe(this, { response: ApiResult ->
//                    if (response.result)
//                        logD(response.msg)
//                })
                setResult(RESULT_OK)
                finish()

            } else showToast(result.msg)
        })


    }
*/


/*


    //나비서 내용
    private fun updateReport(item: ReportDetail2) {
        Log.d(TAG, "updateReport: 수정시작")

        val params = HashMap<String, Any>()
        params[Define.KEYS.AUTH_TOKEN] = Define.VALUES.TOKEN_VALUE
        params[Define.KEYS.INDEX] = item.report.uid
        params[Define.KEYS.MODE] = "update3"
        params[Define.KEYS.TYPE] = if (item.report.type) 1 else 0
        params[ReportRepository.KEY_EXPENSE_TYPE] = if (item.report.expenseType) 1 else 0
        var expenseDate: String = item.report.expenseDate.replace("T", " ")
        expenseDate = expenseDate.substring(0, expenseDate.indexOf('.'))
        params[ReportRepository.KEY_EXPENSE_DATE] = expenseDate

        val participants = ArrayList<Person>()
        viewModel.taskItems.value?.let {
            for (item in it) {
                participants.add(Person(item))
            }
        }
        val shareMember = ArrayList<Person>()
        viewModel.shareItems.value?.let {
            for (item in it) {
                shareMember.add(Person(item))
            }
        }


        params[ReportRepository.KEY_EXPENSE_PERSON] = getPeople(participants)
        params[ReportRepository.KEY_SHARED_PERSON] = getPeople(shareMember)
        params[ReportRepository.KEY_CONT_TITLE] = et_title.text.toString()
        params[Define.KEYS.DESCRIPTION] = etDescription.text.toString()
        params[ReportRepository.KEY_EXPENSE] = "0"
        params[ReportRepository.KEY_EXPENSE_LIST] = 0
        params[ReportRepository.KEY_STEP] = if (item.report.step) 1 else 0
        params[ReportRepository.KEY_SALES_ACCOUNT] = "0"
        params[Define.KEYS.IMAGE1] = ""
        params[Define.KEYS.IMAGE2] = ""
        params[Define.KEYS.IMAGE3] = ""
//        params[Define.KEYS.IMAGE3] = if (uploadedImages.size >= 3) uploadedImages.get(2) else ""
        params[ReportRepository.KEY_FILE1] = if (StringUtil.isNotEmpty(item.report.file1)) item.report.file1 else ""
        params[ReportRepository.KEY_FILE2] = if (StringUtil.isNotEmpty(item.report.file2)) item.report.file2 else ""
        params[ReportRepository.KEY_FILE3] = if (StringUtil.isNotEmpty(item.report.file3)) item.report.file3 else ""
        params[ReportRepository.KEY_FILE_NAME1] = if (StringUtil.isNotEmpty(item.report.fileName1)) item.report.fileName1 else ""
        params[ReportRepository.KEY_FILE_NAME2] = if (StringUtil.isNotEmpty(item.report.fileName2)) item.report.fileName2 else ""
        params[ReportRepository.KEY_FILE_NAME3] = if (StringUtil.isNotEmpty(item.report.fileName3)) item.report.fileName3 else ""


        viewModel.modifyReport(params).observe(this, Observer { result: ApiResult ->
            if (result.result) {
                Log.d(TAG, "updateReport: ")
                //공유자 변경

                //공유자 변경 todo <== 중복됨 더 들어감 확인 안하는듯
//                val list: MutableList<Person> = java.util.ArrayList()
//                for (person in shareMember) {
//                    var isDuplicated = false
//                    for (sharer in item.sharers) {
//                        if (sharer.targetMuid === person.muid) {
//                            isDuplicated = true
//                            break
//                        }
//                    }
//                    if (!isDuplicated) list.add(person)
//                }
//                viewModel.updateShareMember(item.report.uid, list).observe(this, { response: ApiResult ->
//                    if (response.result)
//                        logD(response.msg)
//                })

//                val customers=ArrayList<String>()
//                viewModel.customerItems.value?.let {
//                    for (item in it){
//                        customers.add(item.company)
//                    }
//                }

                //거래처 수정 todo <== 내용에 ### 이름만 넣음
//                viewModel.updateCustomer(item.report.uid, customers).observe(this, { response: ApiResult ->
//                    if (response.result)
//                        logD(response.msg)
//                })
                setResult(RESULT_OK)
                finish()

            } else showToast(result.msg)
        })


    }
*/


    private fun getPeople(list: List<Person>): String {
        var result = ""
        for (person in list) {
            result += String.format("%s,", person.toString())
        }
        return if (result.length > 0) result.substring(0, result.length - 1) else ""
    }


    private fun getNameCard(requestCode: Int) {
//        intent = Intent(this, SelectFromNameCardActivity::class.java)
        intent = Intent(this, NameCardSelectActivity::class.java)
        startActivityForResult(intent, requestCode)
    }


    private fun getGroup(requestCode: Int) {
//        intent = Intent(this, SelectFromSharedGroupActivity::class.java)
        intent = Intent(this, GroupSelectActivity::class.java)
        if (requestCode == REQUEST_SELECT_SHARE_MEMBER) {
            intent.putExtra("group_type", true)
        }
        startActivityForResult(intent, requestCode)
    }


    enum class SHEET { ON, OFF }

    private fun bottomSheet(sheet: SHEET) {
        when (sheet) {
            SHEET.ON -> {
                background.isVisible = true
                bottomSheetBehavior.state = BottomSheetBehavior.STATE_EXPANDED
            }
            SHEET.OFF -> {
                background.isVisible = false
                bottomSheetBehavior.state = BottomSheetBehavior.STATE_COLLAPSED

            }

        }
    }


    override fun initDatabinding() {
        viewModel.reportDate.observe(this, Observer {
            it?.let {
                tv_date.text = it
            }
        })

        viewModel.customerItems.observe(this, {
            it?.let {
                (list_customers.adapter as Adapters).setItems(it)
            }
        })

        viewModel.shareItems.observe(this, {
            it?.let {
                (list_share.adapter as Adapters).setItems(it)
            }
        })

        viewModel.attendeeItems.observe(this, {
            it?.let {
                (list_attendee.adapter as Adapters).setItems(it)
            }
        })

        viewModel.date.observe(this, {
            it?.let {
                //calendarView.date=it.time
                val dateFormat = SimpleDateFormat("yyyy-MM-dd (EEE)")
                tv_date.text = dateFormat.format(it)

            }
        })

        viewModel.reportDetail.observe(this, {
            it?.let {
                et_title.setText(it.report.contTitle)
                etDescription.setText(it.report.description)
                val shareItem = ArrayList<NameCard>()
                for (item in it.sharers) {
                    val nameCard = NameCard()
                    nameCard.level = item.level
                    nameCard.part = item.part
                    nameCard.name = item.name
                    nameCard.photo = item.photo
                    nameCard.company = item.company
                    nameCard.uid = item.targetMuid
                    shareItem.add(nameCard)
                }
                viewModel.setShare(shareItem)

                val attendeesArray = ArrayList<NameCard>()
                for (item in it.attendees) {
                    val nameCard = NameCard()
                    nameCard.level = item.level
                    nameCard.name = item.name
                    nameCard.company = item.company
                    nameCard.uid = item.uid
                    attendeesArray.add(nameCard)
                }
                viewModel.setTask(attendeesArray)


                val fDate = SimpleDateFormat("yyyy-MM-dd") //String을 Date로! 같은 형식으로 맞춰줌

                val day = fDate.parse((it.report.signdate))  //parse로 반대로 벗길 수 있다

                //val day = ((it.report.signdate).toLong() * 1000)

                viewModel.setDate(day)
                calendarView.date = day.time

                if (it.report.customers?.isNotEmpty()== true) {
                    val strArr = it.report.customers.split(",")
                    val arr = ArrayList<CustomerItem>()
                    for (item in strArr) {
                        val customerItem = CustomerItem()
                        customerItem.company = item
                        arr.add(customerItem)
                    }
                    viewModel.setCustomes(arr)
                }

                if (it.Work().image1?.isNotEmpty() == true) {
                    Glide.with(this@AddReportActivity)
                            .load(it.Work().image1)
                            .diskCacheStrategy(DiskCacheStrategy.NONE) //디스크 캐시 저장 off
                            .skipMemoryCache(true) //메모리 캐시 저장 off
                            .into(ibtn_upload_image1)
                    ibtn_upload_image1.visibility = View.VISIBLE
                }
                if (it.Work().image2?.isNotEmpty() == true) {
                    Glide.with(this@AddReportActivity)
                            .load(it.Work().image2)
                            .diskCacheStrategy(DiskCacheStrategy.NONE) //디스크 캐시 저장 off
                            .skipMemoryCache(true) //메모리 캐시 저장 off
                            .into(ibtn_upload_image2)
                    ibtn_upload_image2.visibility = View.VISIBLE
                }

                if (it.Work().image3?.isNotEmpty() == true) {
                    Glide.with(this@AddReportActivity)
                            .load(it.Work().image3)
                            .diskCacheStrategy(DiskCacheStrategy.NONE) //디스크 캐시 저장 off
                            .skipMemoryCache(true) //메모리 캐시 저장 off
                            .into(ibtn_upload_image3)
                    ibtn_upload_image3.visibility = View.VISIBLE
                }
            }
        })

        viewModel.check.observe(this, {
            it?.let {
                if (it) {
                    setResult(RESULT_OK)
                    finish()
                }
            }
        })

    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (resultCode == RESULT_OK) {
            when (requestCode) {
                REQUEST_SELECT_CUSTOMERS -> {
                    data?.let {
                        val customerItems = it.getSerializableExtra("items") as ArrayList<CustomerItem>
                        viewModel.setCustomes(customerItems)
                        if (customerItems.size > 0) {

//                            val cmpCd= customerItems[customerItems.size-1].cmp_cd
//                            if (cmpCd!=0 || cmpCd!=-1 ){
//                                intent = Intent(this, NameCardSelectActivity::class.java)
//                                intent.putExtra("customer_item",customerItems[customerItems.size-1])
//                                startActivityForResult(intent, REQUEST_SELECT_TASK)
//                            }

                            // 2020-11-29 CMP_CD값이 없는 경우, 회사명으로 검색
                            val cmpCd = customerItems[customerItems.size - 1].cmp_cd
                            var company = customerItems[customerItems.size - 1].company
                            intent = Intent(this, NameCardSelectActivity::class.java)
                            if (cmpCd < 0) {
                                if (!company.isEmpty()) {
                                    if (company.contains("㈜")) company = company.replace("㈜", "")
                                    if (company.contains("(주)")) company = company.replace("(주)", "")
                                    if (company.contains("(사)")) company = company.replace("(사)", "")
                                    if (company.contains("(재)")) company = company.replace("(재)", "")
                                    if (company.contains("주식회사")) company = company.replace("주식회사", "")
                                }
                                intent.putExtra("company", company)
                            } else {
                                intent.putExtra("cmp_cd", cmpCd)
                            }
                            intent.putExtra("cmp_cd", cmpCd)
                            logD("onActivityResult() -> company : $company")
                            startActivityForResult(intent, REQUEST_SELECT_TASK)
                        }
                    }
                }
                REQUEST_SELECT_TASK -> {
                    data?.let {
                        viewModel.setTask(it.getSerializableExtra("items") as ArrayList<NameCard>)
                    }
                }
                REQUEST_SELECT_SHARE_MEMBER -> {
                    data?.let {
                        viewModel.setShare(it.getSerializableExtra("items") as ArrayList<NameCard>)
                    }
                }
                FILE_REQUEST -> {
                    data?.let {
                        var fileName = ""
                        var extension = ""
                        val uri = data.data
                        val file: File = FileUtil.getFile(this, uri)
                        if (uri.toString().startsWith("content://")) {
                            var cursor: Cursor? = null
                            try {
                                cursor = contentResolver.query(uri!!, null, null, null, null)
                                if (cursor != null && cursor.moveToFirst()) {
                                    fileName = cursor.getString(cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME))
                                }
                            } finally {
                                cursor!!.close()
                            }
                        } else if (uri.toString().startsWith("file://")) {
                            fileName = file.name
                        }
                        if (StringUtil.isNotEmpty(fileName)) extension = fileName.substring(fileName.indexOf('.') + 1)
                        logD("onActivityResult() -> fileName : $fileName")
                        logD("onActivityResult() -> extension : $extension")
                        if (StringUtil.isNotEmpty(extension)) {
                            // 이미지 파일인지 확인
                            if ("jpg jpeg gif png bmp".contains(extension.toLowerCase()))
                                validateImage(data)
//                            else
//                                requestUploadFile(file, fileName, extension)
                        }
                    }

                }
            }
        }
    }


    /**
     * 이미지 여부 확인
     *
     * @param data
     */
    private fun validateImage(data: Intent) {

        try {
            var uri = data.data
            // 넥서스 계열 대비
            if (uri == null) {
                val extras = data.extras
                val imageBitmap = extras!!["data"] as Bitmap?
                val bytes = ByteArrayOutputStream()
                imageBitmap!!.compress(Bitmap.CompressFormat.JPEG, 100, bytes)
                val path = MediaStore.Images.Media.insertImage(applicationContext.contentResolver, imageBitmap, "Title", null)
                uri = Uri.parse(path)
            }
            val imageName = getImageName(uri!!)
            logD("onActivityResult() -> Image Name : $imageName")
            if (imageName != null && imageName.length > 0) {
                val isImage: Boolean = checkImageFile(imageName)
                logD("onActivityResult() -> isImage : $isImage")
                if (isImage) {
                    createTempFile()
                    val bitmap: Bitmap = ImageUtil.getBitmap(contentResolver, uri)
                    val orientation: Int = ImageUtil.getOrientation(this, uri)
                    logD("onActivityResult() -> orientation : $orientation")
                    if (orientation > 0) {
                        val rotatedBitmap: Bitmap = ImageUtil.rotatedBitmap(bitmap, orientation)
                        bitmap.recycle()
                        ImageUtil.createImageFile(photoPath, rotatedBitmap)
                        rotatedBitmap.recycle()
                    } else {
                        ImageUtil.createImageFile(photoPath, bitmap)
                        bitmap.recycle()
                    }
                    var index = ""
                    when (indexImage) {
                        FILE1 -> index = "image1"
                        FILE2 -> index = "image2"
                        FILE3 -> index = "image3"
                    }
                    requestUploadImage(index)
                }
            } else {
                showToast("올바른 이미지가 아닙니다.")

            }
        } catch (e: IOException) {
            logE(e.message.toString())
            showToast("올바른 이미지가 아닙니다.")
        }
    }

    private var photoPath = ""

    /**
     * 임시 이미지 파일 생성
     *
     * @return
     * @throws IOException
     */
    @Throws(IOException::class)
    private fun createTempFile(): File? {
        val timeStamp = SimpleDateFormat("yyyyMMdd_HHmmss").format(Date())
        val imageFileName = "JPEG_" + timeStamp + "_"
        val storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)
        val image = File.createTempFile(
                imageFileName,
                ".jpg",
                storageDir
        )
        photoPath = image.absolutePath
        return image
    }

    /**
     * 이미지 파일명 가져오기
     *
     * @param uri
     * @return
     */
    private fun getImageName(uri: Uri): String? {
        val projection = arrayOf(MediaStore.Images.ImageColumns.DISPLAY_NAME)
        val cursor = managedQuery(uri, projection, null, null, null)
        var result: String? = null
        if (cursor != null) {
            val index = cursor.getColumnIndexOrThrow(MediaStore.Images.ImageColumns.DISPLAY_NAME)
            cursor.moveToFirst()
            result = cursor.getString(index)
        }
        return result
    }

    /**
     * 이미지 파일 확인
     *
     * @param imageName
     * @return
     */
    fun checkImageFile(imageName: String): Boolean {
        val extensions = arrayOf("jpg", "png", "gif", "jpeg")
        for (extension in extensions) {
            if (imageName.toLowerCase().endsWith(extension)) {
                return true
            }
        }
        return false
    }

    /**
     * 첨부 사진 업로드
     *
     * @param idx
     */
    private fun requestUploadImage(idx: String) {

//        pb.setVisibility(View.VISIBLE)
        val params: MutableMap<String, Any> = HashMap()
        params["auth_token"] = "ehdskavkdnjxpr20186315650033dbfldzmssil"
        params["type"] = "expense"
        params["muid"] = GlobalApplication.account.values.muid
        params["idx"] = idx
        val file = File(photoPath)
//        val requestFile:RequestBody = RequestBody.create("multipart/form-data".toMediaTypeOrNull(), file)
        val requestFile:RequestBody = file.asRequestBody("multipart/form-data".toMediaTypeOrNull())

        val part: MultipartBody.Part = MultipartBody.Part.createFormData("fileData", file.name, requestFile)

        val service: ApiService = NetworkHelper.getService()
        val call: Call<ApiResult.ResultImageUpload> = service.uploadImage(params, part)
        call.enqueue(object : Callback<ApiResult.ResultImageUpload?> {
            override fun onResponse(call: Call<ApiResult.ResultImageUpload?>, response: Response<ApiResult.ResultImageUpload?>) {
                if (response.isSuccessful) {
                    //upload 성공
                    logD(String.format("[%s]Success request Body : %s".trimIndent(), "requestUploadImage", response.body()))
                    val result = response.body()
                    val builder = StringBuilder()
                    builder.append(result!!.path)
                    builder.append(result.fileName)
                    val path = builder.toString()
                    when (indexImage) {
                        FILE1 -> {
                            image1 = path
                            ImageUtil.deleteFile(path)
                            if (StringUtil.isNotEmpty(path)) {
                                //AQuery Image remove(2019-11-01 오전 9:24)
                                Glide.with(this@AddReportActivity)
                                        .load(path)
                                        .diskCacheStrategy(DiskCacheStrategy.NONE) //디스크 캐시 저장 off
                                        .skipMemoryCache(true) //메모리 캐시 저장 off
                                        .into(ibtn_upload_image1)
                                ibtn_upload_image1.visibility = View.VISIBLE

                            }
                        }
                        FILE2 -> {
                            image2 = path
                            ImageUtil.deleteFile(path)
                            if (StringUtil.isNotEmpty(image2)) {
                                //AQuery Image remove(2019-11-01 오전 9:24)
                                Glide.with(this@AddReportActivity)
                                        .load(path)
                                        .diskCacheStrategy(DiskCacheStrategy.NONE) //디스크 캐시 저장 off
                                        .skipMemoryCache(true) //메모리 캐시 저장 off
                                        .into(ibtn_upload_image2)
                                ibtn_upload_image2.visibility = View.VISIBLE
                            }
                        }
                        FILE3 -> {
                            image3 = path
                            ImageUtil.deleteFile(path)
                            if (StringUtil.isNotEmpty(path)) {
                                //AQuery Image remove(2019-11-01 오전 9:25)
                                Glide.with(this@AddReportActivity)
                                        .load(path)
                                        .diskCacheStrategy(DiskCacheStrategy.NONE) //디스크 캐시 저장 off
                                        .skipMemoryCache(true) //메모리 캐시 저장 off
                                        .into(ibtn_upload_image3)
                                ibtn_upload_image3.visibility = View.VISIBLE

                            }
                        }
                    }
                } else {
                    (String.format("[%s]Failed to request Code : %d".trimIndent(), "requestUploadImage", response.code()))
                }
//                pb.setVisibility(View.GONE)
            }

            override fun onFailure(call: Call<ApiResult.ResultImageUpload?>, t: Throwable) {
                logE(String.format("[%s]Failed to connect Message : %s"
                        .trimIndent(), "requestUploadImage", t.message))
            }
        })
        logD("requestUploadImage() -> params : $params")
    }
}
