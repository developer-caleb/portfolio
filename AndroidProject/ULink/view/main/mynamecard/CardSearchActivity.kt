package com.bsni.nameq.v2.view.main.mynamecard

import android.content.Intent
import android.net.Uri
import android.os.Parcelable
import android.provider.ContactsContract
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.LinearLayout
import androidx.core.view.isVisible
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.RecyclerView
import com.bsni.nameq.R
import com.bsni.nameq.activities.customer.CustomerListActivity
import com.bsni.nameq.activities.enterprise.SelectFromSharedGroupActivity
import com.bsni.nameq.common.Define
import com.bsni.nameq.databinding.ActivityCardSearchBinding
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.item.ShareItem
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.getInstallPackage
import com.bsni.nameq.v2.viewmodel.main.mynamecard.CardSearchViewModel
import com.google.android.material.bottomsheet.BottomSheetBehavior
import kotlinx.android.synthetic.main.activity_card_search.*
import kotlinx.android.synthetic.main.bottom_card_info.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CardSearchActivity : ActivityBase<ActivityCardSearchBinding,CardSearchViewModel>() {


    override val layoutResourceId: Int
        get() = R.layout.activity_card_search
    override val viewModel: CardSearchViewModel by viewModel()

    val adapters: Adapters = Adapters(R.layout.item_name_card2, ArrayList())
    private lateinit var bottomSheetBehavior : BottomSheetBehavior<LinearLayout>

    companion object {
        const val REQUEST_SELECT_SHARE_MEMBER = 111
    }


    override fun init() {
        tvTitle.text="검색"
        btn_send.visibility=View.GONE
        text_layout.visibility=View.VISIBLE
        card_list.adapter=adapters
        bottomSheetBehavior= BottomSheetBehavior.from(bottom_sheet_layout as LinearLayout)

    }

    override fun initListener() {

        et_name.addTextChangedListener(object : TextWatcher{
            override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable) {

                if(s.isNotEmpty()){
                    btn_send.visibility= View.VISIBLE
                    viewModel.getCards(s.toString())
                }else{
                    btn_send.visibility= View.GONE
                }
            }
        })

        btn_send.setOnClickListener {
            et_name.text.clear()
            adapters.setItems(ArrayList())
            text_layout.visibility=View.VISIBLE
        }

        adapters.onListClickListener { _, position ->
            viewModel.cardItems.value?.let {
                val nameCard: NameCard = it[position] as NameCard
//                val intent = Intent(applicationContext, NameCardActivity::class.java)
                val intent = Intent(applicationContext, CardDetailActivity::class.java)
                intent.putExtra(Define.KEYS.NAME_CARD, nameCard as Parcelable)
                startActivity(intent)
            }
        }

        adapters.onPositionCallbackListener { po->
            viewModel.setCardItem(po)

        }
        initBottomSheetListener()
        val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
        et_name.requestFocus()
        imm.showSoftInput(et_name, InputMethodManager.SHOW_IMPLICIT)

        card_list.addOnScrollListener(object : RecyclerView.OnScrollListener() {
            override fun onScrollStateChanged(recyclerView: RecyclerView, newState: Int) {
                super.onScrollStateChanged(recyclerView, newState)
                if (newState == 1) {
                    imm.hideSoftInputFromWindow(
                        et_name.getWindowToken(),
                        InputMethodManager.HIDE_NOT_ALWAYS
                    )
                }
            }})


    }

    private fun initBottomSheetListener(){

        bottom_sheet_layout.setOnClickListener {}

        btn_img_cancel.setOnClickListener {
            bottomSheet(SHEET.OFF)
        }
        /*
        btn_cancel.setOnClickListener {
            bottomSheet(SHEET.OFF)
        }
*/
        bottomSheetBehavior.addBottomSheetCallback(object : BottomSheetBehavior.BottomSheetCallback() {
            override fun onSlide(bottomSheet: View, slideOffset: Float) {}
            override fun onStateChanged(bottomSheet: View, newState: Int) {
                if (newState == BottomSheetBehavior.STATE_COLLAPSED) {
                    bottomSheet(SHEET.OFF)
                }
            }
        })

        btn_sms_send.setOnClickListener {
            viewModel.share(ShareItem.SHARE.SNS)
        }
        btn_kakao.setOnClickListener {
            viewModel.share(ShareItem.SHARE.KAKAO)
        }
        btn_band.setOnClickListener {
            viewModel.share(ShareItem.SHARE.BAND)
        }

        btn_share.setOnClickListener {
            //todo uid검사하고 있음 이유는 모르겠음
            if (viewModel.cardItem.value!!.uid > -1){
                val intent = Intent(applicationContext, SelectFromSharedGroupActivity::class.java)
                startActivityForResult(intent, REQUEST_SELECT_SHARE_MEMBER)
            }else{
                showToast("잘못된 접근입니다.")
                bottomSheet(SHEET.OFF)
            }
        }

        btn_add_phone.setOnClickListener {

            viewModel.cardItem.value?.let {

                val intent = Intent(ContactsContract.Intents.Insert.ACTION).apply {
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

        btn_del.setOnClickListener {
            viewModel.cardItem.value?.let {
                val di= DialogCustom(this, DiglogItem(
                        "명함삭제",
                        "${it.name} 님의 명함을 삭제하시겠습니까?",
                        "", "삭제"))
                di.setOnDismissListener {
                    if (di.check){
                        viewModel.delNameCard()
                        bottomSheet(SHEET.OFF)
                    }
                }
            }
        }

    }

    enum class SHEET{ON,OFF}
    private fun bottomSheet(sheet: SHEET){
        when(sheet){
            SHEET.ON -> {
                background.isVisible=true
                bottomSheetBehavior.state = BottomSheetBehavior.STATE_EXPANDED
            }
            SHEET.OFF -> {
                background.isVisible = false

                bottomSheetBehavior.state = BottomSheetBehavior.STATE_COLLAPSED
            }
        }
    }

    override fun initDatabinding() {
        viewModel.cardItems.observe(this, Observer {
            adapters.setItems(it)
            if (it.size>0){
                text_layout.visibility=View.GONE
            }else{
                text_layout.visibility=View.VISIBLE
            }
        })

        viewModel.cardItem.observe(this, Observer {
            bottomSheet(SHEET.ON)
            tv_name.text = it.name
        })

        viewModel.mag.observe(this, Observer {
            it?.let {
                showToast(it)
            }
        })

        viewModel.shareData.observe(this, Observer {
            it?.let {
                when (it.type) {
                    ShareItem.SHARE.SNS -> {
                        val intent = Intent("android.intent.action.SENDTO", Uri.parse("smsto:"))
                        intent.putExtra("sms_body", it.msg)
                        startActivity(intent)
                    }
                    ShareItem.SHARE.BAND -> {
                        if (getInstallPackage(applicationContext, "com.nhn.android.band")) {
                            val intent = Intent(Intent.ACTION_SEND)
                            intent.type = "text/plain"
                            intent.putExtra(Intent.EXTRA_SUBJECT, "")
                            intent.putExtra(Intent.EXTRA_TEXT, it.msg)
                            intent.setPackage("com.nhn.android.band")
                            startActivity(intent)
                        } else {
                            showToast("BAND가 설치되지 않았습니다.")
                        }
                    }
                    ShareItem.SHARE.KAKAO -> {
                    //    KakaoLink.kakaoLink(this)

                 /*       val params = TextTemplate
                                .newBuilder(it.msg, LinkObject.newBuilder()
                                        .setMobileWebUrl(it.url)
                                        .build())
                                .addButton(ButtonObject(resources.getString(R.string.deliver_kakao_btn_intro), LinkObject.newBuilder()
                                        .setMobileWebUrl(resources.getString(R.string.url_introduction))
                                        .build()))
                                .addButton(ButtonObject(resources.getString(R.string.deliver_kakao_btn_start), LinkObject.newBuilder()
                                        .setMobileWebUrl(it.url)
                                        .build()))
                                .build()
                        KakaoLinkService.getInstance().sendDefault(applicationContext, params, object : ResponseCallback<KakaoLinkResponse>() {
                            override fun onFailure(errorResult: ErrorResult) {
                            }

                            override fun onSuccess(rst: KakaoLinkResponse) {
                            }
                        })*/
                    }
                }
                bottomSheet(SHEET.OFF)
            }
        })
    }

}