package com.bsni.nameq.v2.view.main.mynamecard


import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Parcelable
import android.provider.ContactsContract
import android.util.Log
import android.view.View
import android.view.animation.AnimationUtils
import android.widget.AdapterView
import android.widget.ImageView
import android.widget.TextView
import androidx.core.view.isVisible
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.bsni.nameq.R
import com.bsni.nameq.activities.enterprise.SelectFromSharedGroupActivity
import com.bsni.nameq.activities.namecard.views.AddNameCardActivity
import com.bsni.nameq.activities.namecard.views.ExchangeActivity
import com.bsni.nameq.activities.namecard.views.GroupExchangeActivity
import com.bsni.nameq.common.Define
import com.bsni.nameq.databinding.FragmentCardListBinding
import com.bsni.nameq.models.database.Group
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.dialog.BottomSheetDialog2
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.item.ShareItem.SHARE
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.adapters.SpinnerAdapter
import com.bsni.nameq.v2.util.basic.FragmentBase
import com.bsni.nameq.v2.util.common.FragmentCallBack
import com.bsni.nameq.v2.util.common.getInstallPackage
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.viewmodel.main.mynamecard.CardListViewModel
import com.bsni.nameq.v3.util.KakaoLink
import com.bsni.nameq.v3.util.KakaoLink.Companion.kakaoLink
import com.kakao.sdk.template.model.*
import kotlinx.android.synthetic.main.card_list_fragment.*
import org.koin.androidx.viewmodel.ext.android.viewModel


class CardList2Fragment : FragmentBase<FragmentCardListBinding, CardListViewModel>() {
    var TAG = "CardList2Fragment"
    override val layoutResourceId: Int
        get() = R.layout.card_list_fragment
    override val viewModel: CardListViewModel by viewModel()

//    val adapters:Adapters = Adapters(R.layout.item_name_card2, ArrayList())
//    private lateinit var bottomSheetBehavior : BottomSheetBehavior<LinearLayout>

    companion object {
        @JvmStatic
        fun newInstance(): Fragment {
            return CardList2Fragment()
        }
        const val REQUEST_GROUP_MEMBER = 110
        const val REQUEST_SELECT_SHARE_MEMBER = 111
        const val REQUEST_ADD_NAMECARD = 112
        const val REQUEST_GROUP_MODIFY = 113
    }

    override fun init() {
        rvNameCards.adapter=Adapters(R.layout.item_name_card2, ArrayList())
        viewModel.getGroup()
        viewModel.getClosePerson()


//        bottomSheetBehavior= BottomSheetBehavior.from(bottom_sheet_layout as LinearLayout)
        rvNameCards.addItemDecoration(DividerItemDecoration(context, LinearLayoutManager.VERTICAL))

    }



    override fun initListener() {

        etBtn.setOnClickListener {
            viewModel.setEditing()
        }
        search_btn.setOnClickListener {
            startActivity(Intent(context, CardSearchActivity::class.java))
        }

        groupBtn.setOnClickListener {
            startActivityForResult(Intent(context, CardListGroupActivity::class.java), REQUEST_GROUP_MEMBER)
        }

        (rvNameCards.adapter as Adapters).onListClickListener(onClickListener = { _, position ->

            //상세페이지
            if (viewModel.isEdit.value!!) {
                viewModel.cardItems.value?.let {
                    val nameCard: NameCard = it[position] as NameCard
//                    val intent = Intent(context, NameCardActivity::class.java)
                    val intent = Intent(context, CardDetailActivity::class.java)
                    intent.putExtra(Define.KEYS.NAME_CARD, nameCard as Parcelable)
                    startActivityForResult(intent, REQUEST_ADD_NAMECARD)
                }
            } else {
                viewModel.groupCheck(position)
            }
        })
        (rvNameCards.adapter as Adapters).onListLongClickListener{ view, po ->
            //showToast("ㅇㅇ?");
        //    Log.d(TAG, "initListener: longclick")
            viewModel.setEditing()
            viewModel.groupCheck(po)
                }
        
        //...버튼 눌렀을 때
        (rvNameCards.adapter as Adapters).onPositionCallbackListener { po ->
            viewModel.setCardItem(po)
        }

        spnOrder.onItemSelectedListener=object :AdapterView.OnItemSelectedListener{
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                logD("명함첩 쿼리 수정")
                viewModel.setOrder(spnOrder.selectedItem.toString())
            }
            override fun onNothingSelected(parent: AdapterView<*>?) {}
        }

        initGroupListener()
        initFabListener()
    }


    private fun initFabListener(){

        background.setOnClickListener{}

        fbMain.setOnClickListener {
            viewModel.setFab()
        }
        fbSub4.setOnClickListener {
            val intent = Intent(context, AddNameCardActivity::class.java)
            intent.putExtra(Define.KEYS.IS_GALLERY, false)
            startActivityForResult(intent, REQUEST_ADD_NAMECARD)
            viewModel.setFab()
        }
        fbSub3.setOnClickListener {
            val intent = Intent(context, AddNameCardActivity::class.java)
            intent.putExtra(Define.KEYS.IS_GALLERY, true)
            startActivityForResult(intent, REQUEST_ADD_NAMECARD)
            viewModel.setFab()
        }
        fbSub2.setOnClickListener {
            showToast("수정 중인 기능입니다.")
           /* val intent = Intent(context, ExchangeActivity::class.java)
            startActivity(intent)
            viewModel.setFab()*/
        }
        fbSub1.setOnClickListener {
            val intent = Intent(context, GroupExchangeActivity::class.java)
            startActivity(intent)
            viewModel.setFab()
        }
    }

    private fun initBottomSheetListener(dialogType: BottomSheetDialog2.DIALOGTYPE?){

        when(dialogType){
            BottomSheetDialog2.DIALOGTYPE.SMS -> {
                viewModel.share(SHARE.SNS)
            }
            BottomSheetDialog2.DIALOGTYPE.KAKAO -> {
                viewModel.share(SHARE.KAKAO)
            }

            BottomSheetDialog2.DIALOGTYPE.BAND -> {
                viewModel.share(SHARE.BAND)
            }

            BottomSheetDialog2.DIALOGTYPE.SHARE -> {
                //todo uid검사하고 있음 이유는 모르겠음
                if (viewModel.cardItem.value!!.uid > -1) {
                    val intent = Intent(context, SelectFromSharedGroupActivity::class.java)
                    startActivityForResult(intent, REQUEST_SELECT_SHARE_MEMBER)
                } else {
                    showToast("잘못된 접근입니다.")
//                    bottomSheet(SHEET.OFF)
                }
            }

            BottomSheetDialog2.DIALOGTYPE.ADD -> {
                viewModel.cardItem.value?.let {

                    Intent(ContactsContract.Intents.Insert.ACTION).apply {
                        type = ContactsContract.RawContacts.CONTENT_TYPE

                        putExtra(ContactsContract.Intents.Insert.EMAIL, it.email)
                        putExtra(
                                ContactsContract.Intents.Insert.EMAIL_TYPE,
                                ContactsContract.CommonDataKinds.Email.TYPE_WORK
                        )
                        putExtra(ContactsContract.Intents.Insert.PHONE, it.hp)
                        putExtra(
                                ContactsContract.Intents.Insert.PHONE_TYPE,
                                ContactsContract.CommonDataKinds.Phone.TYPE_WORK
                        )
                        putExtra(ContactsContract.Intents.Insert.NAME, it.name)
                        putExtra(ContactsContract.Intents.Insert.COMPANY, it.company)
                        startActivity(this)
                    }

                }
            }
            BottomSheetDialog2.DIALOGTYPE.DEL -> {
                viewModel.cardItem.value?.let {
                    val di = DialogCustom(context!!, DiglogItem(
                            "명함삭제",
                            "${it.name} 님의 명함을 삭제하시겠습니까?",
                            "", "삭제"))
                    di.setOnDismissListener {
                        if (di.check) {
                            viewModel.delNameCard()
//                            bottomSheet(SHEET.OFF)
                        }
                    }
                }
            }
        }
    }


    private fun initGroupListener(){


        btn_sms.setOnClickListener {
            var selectedList=viewModel.getSelectItmes()
            if (selectedList.size>0){
                if (selectedList.size > 300) {
                    showToast(String.format("총 %d명을 선택하셨습니다. 최대 선택 가능 인원은 300명입니다.", selectedList.size))
                } else {
                    var str=""
                    for (item in selectedList) {
                        str+="${item.hp};"
                    }
                    val uri = Uri.parse("smsto:$str")
                    val intent = Intent(Intent.ACTION_SENDTO, uri)
                    startActivity(intent)
                    viewModel.setEditing()
                }
            }

        }

        btn_card_edit.setOnClickListener {
            logD("btn_card_edit")
            var selectedList=viewModel.getSelectItmes()
            val intent=Intent(context, CardListGroupActivity::class.java)
            intent.putExtra("items", selectedList)
            startActivityForResult(intent, REQUEST_GROUP_MEMBER)
            viewModel.setEditing()
        }

        btn_card_del.setOnClickListener{
            context?.let {
                val di=DialogCustom(context!!, DiglogItem("명함 삭제","명함을 삭제하시겠습니까?"))
                di.setOnDismissListener {
                    if (di.check){
                        viewModel.allDelNameCard(viewModel.getSelectItmes())
                    }
                }
            }


        }

    }


    override fun initLiveData() {
        //정렬 관련
        viewModel.orders.observe(this, Observer {
            spnOrder.adapter = context?.let { it1 ->
                SpinnerAdapter(it1, ArrayList(it.keys), R.layout.spinner_item_cardlist, R.layout.spinner_item_cardlist_dropdown)
            }
        })

        //편집 누르면 실행되는 것
        viewModel.isEdit.observe(this, Observer {

            callback?.let { callback ->
                callback.onCallBack(it)
            }

            var color = if (it) {
                etBtn.text = "편집"
                viewModel.clanCheck()
                fbMain.show()
                R.color.black
            } else {
                etBtn.text = "취소"
                fbMain.hide()
                R.color.red
            }
            topLayout.isEnabled = it
            search_btn.isEnabled = it
            groupBtn.isEnabled = it
            groupText.isEnabled = it
            groupImg.isEnabled = it
            spnOrder.isEnabled = it
            bottom_layout.isVisible = !it

            spnOrder.selectedView?.let { view ->
                view.findViewById<ImageView>(R.id.spitemImg).isEnabled = it
                view.findViewById<TextView>(R.id.text).isEnabled = it
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                etBtn.setTextColor(resources.getColor(color, activity!!.theme))
            } else {
                etBtn.setTextColor(resources.getColor(color))
            }
            viewModel.setUiCheck(it)

            viewModel.cardItems.value?.let { items ->
                if (items.size <= 4) {
                    val metrics = resources.displayMetrics
                    val screenHeight = metrics.heightPixels

                    val UNBOUNDED = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED)
                    topLayout.measure(UNBOUNDED, UNBOUNDED)
                    layout_list.layoutParams.height= screenHeight-topLayout.measuredHeight-bottom_layout.layoutParams.height
                }

            }


        })

        //카드아이템 불러온 뒤에 gone 하기
        viewModel.cardItems.observe(this, Observer {
           //progressBar.visibility = View.GONE
            (rvNameCards.adapter as Adapters).setItems(it)
//            logD("it=${it.size}")
        })
        //편집버튼 눌렀을 때
        viewModel.isGroupEdit.observe(this, Observer {
            bottom_layout.isEnabled = it
            btn_sms.isEnabled = it
            btn_card_edit.isEnabled = it
            btn_card_del.isEnabled = it
        })
        //fab button 눌렀을 때
        viewModel.isFab.observe(this, Observer {
            if (it) {
                fbMain.startAnimation(AnimationUtils.loadAnimation(context, R.anim.rotate_to_45))
                fbSub1.show()
                fbSub2.show()
                fbSub3.show()
                fbSub4.show()
            } else {
                fbMain.startAnimation(AnimationUtils.loadAnimation(context, R.anim.rotate_to_360))
                fbSub1.hide()
                fbSub2.hide()
                fbSub3.hide()
                fbSub4.hide()
            }
            background.isVisible = it
            tvSub1.isVisible = it
            tvSub2.isVisible = it
            tvSub3.isVisible = it
            tvSub4.isVisible = it

        })

        //... ui 처리
        viewModel.cardItem.observe(this, {


            val bsd = BottomSheetDialog2(it.name)
            bsd.show(childFragmentManager, bsd.tag)
            bsd.setCallBack {

                initBottomSheetListener(it)

                bsd.dismiss()
            }
        })


        viewModel.shareData.observe(this, {
            it?.let {
                when (it.type) {
                    SHARE.SNS -> {
                        val intent = Intent("android.intent.action.SENDTO", Uri.parse("smsto:"))
                        intent.putExtra("sms_body", it.msg)
                        context?.startActivity(intent)
                    }
                    SHARE.BAND -> {
                        if (getInstallPackage(context!!, "com.nhn.android.band")) {
                            val intent = Intent(Intent.ACTION_SEND)
                            intent.type = "text/plain"
                            intent.putExtra(Intent.EXTRA_SUBJECT, "")
                            intent.putExtra(Intent.EXTRA_TEXT, it.msg)
                            intent.setPackage("com.nhn.android.band")
                            context?.startActivity(intent)
                        } else {
                            showToast("BAND가 설치되지 않았습니다.")
                        }
                    }
                    SHARE.KAKAO -> {
                        KakaoLink.kakaoLink(requireContext(), it.msg, it.url, resources.getString(R.string.deliver_kakao_btn_new))
                        //SNSUtil.sendKakaoLink(context, message, url, callback);


                    }
                }
//                bottomSheet(SHEET.OFF)
            }
        })
        viewModel.mag.observe(this, {
            it?.let {
                showToast(it)
            }
        })

    }
    fun progressbarVisible()
    {
        progressBar.visibility = View.VISIBLE
    }
    fun progressbargone()
    {
        progressBar.visibility = View.GONE
    }

    fun getNameCard(){
        viewModel.getNameCardItems()
    }

  /*  override fun onResume() {
        super.onResume()
        // getNameCard() -> add에서 돌아왔을 때,, result OK 하면 finish 됨 그러니까 이중으로 하지말길..
    // resume에 하면 왔다갔다하면 정보 없어지고 안좋음
    }*/
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
      Log.d(TAG, "onActivityResult: request code : ${requestCode} + resultcode + ${resultCode}")

        if (resultCode==Activity.RESULT_OK  ){
            when(requestCode){
                REQUEST_GROUP_MEMBER -> {
                    data?.let {
                        it.getSerializableExtra("group")?.let { it1 ->

                            val group = it1 as Group
                            var groupName: CardListViewModel.GroupName? = when (group.name) {
                                "전체" -> CardListViewModel.GroupName.ALL
                                "Link명함" -> CardListViewModel.GroupName.LINK
                                "촬영명함" -> CardListViewModel.GroupName.OCR
                                "주요인맥" -> CardListViewModel.GroupName.IMPORTANTPERSON
                                "친한인맥" -> CardListViewModel.GroupName.CLOSEPERSON
                                else -> CardListViewModel.GroupName.NONE
                            }
                            groupText.text = group.name
                            if (groupName != null && groupName != CardListViewModel.GroupName.NONE) {
                                viewModel.setGroup(groupName)
                            } else if (groupName == CardListViewModel.GroupName.NONE) {
                                viewModel.setGroup(groupName, group.uid)
                            }
                        }
                    }
                }
                REQUEST_SELECT_SHARE_MEMBER -> {
                    data?.let {
                        val selected = it.getParcelableArrayListExtra<NameCard>("selected") as ArrayList<NameCard>
                        if (selected.size > 0) {
                            viewModel.shareNameCard(selected)
                        }
                    }
                }
                REQUEST_ADD_NAMECARD -> {

                    viewModel.getNameCardItems()
                }
            }


        }
    }

    //main backbtn 막기 용도임
    fun isEdit():Boolean{
        if (!viewModel.isEdit.value!!){
            viewModel.setEditing()
            return false
        }
//        if (viewModel.isBottomSheet){
//            bottomSheet(SHEET.OFF)
//            return false
//        }
        return true
    }


    //main callback
    internal var callback: FragmentCallBack? = null
    fun setOnHeadlineSelectedListener(callback: FragmentCallBack) {
        this.callback = callback
    }






}