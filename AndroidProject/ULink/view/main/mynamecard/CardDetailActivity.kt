package com.bsni.nameq.v2.view.main.mynamecard

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Parcelable
import android.util.Log
import android.view.View
import androidx.core.view.isVisible
import androidx.lifecycle.Observer
import com.bsni.nameq.R
import com.bsni.nameq.activities.enterprise.SearchCompanyInfoActivity
import com.bsni.nameq.activities.namecard.views.GoogleMapActivity
import com.bsni.nameq.activities.namecard.views.MemoListActivity
import com.bsni.nameq.activities.namecard.views.NameCardImageActivity
import com.bsni.nameq.common.ContactUtil
import com.bsni.nameq.common.Define
import com.bsni.nameq.common.StringUtil
import com.bsni.nameq.databinding.ActivityCardDetailBinding
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.viewmodel.main.mynamecard.CardDetaliViewModel
import com.bsni.nameq.v3.mypage.CardImageAdapter2
import com.bumptech.glide.Glide
import kotlinx.android.synthetic.main.activity_card_detail.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.*

class CardDetailActivity : ActivityBase<ActivityCardDetailBinding, CardDetaliViewModel>() , CardImageAdapter2.CardImageActionListener{
    private var TAG = "CardDetailActivity"
    private var adapter: CardImageAdapter2? = null
    override val layoutResourceId: Int
        get() = R.layout.activity_card_detail
    override val viewModel: CardDetaliViewModel  by viewModel()
//    private val geocoder: Geocoder?=Geocoder(this, Locale.KOREA)

    companion object {
        const val REQUEST_RANK = 112
        const val REQUEST_EDIT = 113
    }

    override fun init() {
        //viewpager 미리보기 생성
        adapter = CardImageAdapter2(this, this)
        //viewpager 미리보기 생성
        val dpValue = 20
        val d = resources.displayMetrics.density
        val margin = (dpValue * d).toInt()
        viewPager.setClipToPadding(false)
        viewPager.setPadding(margin, 0, margin, 0)
        viewPager.setPageMargin(margin / 2)
        //viewpager 생성
        //viewpager 생성
        viewPager.setAdapter(adapter)


        tvTitle.text="명함 상세"
        subBtn.apply {
            text="편집"
            isVisible=true
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            subBtn.setTextColor(resources.getColor(R.color.black, theme))
        } else {
            subBtn.setTextColor(resources.getColor(R.color.black))
        }

        if (intent.hasExtra(Define.KEYS.NAME_CARD)){
            val card :NameCard= intent.getParcelableExtra<NameCard>(Define.KEYS.NAME_CARD) as NameCard
            logD("card.uid=${card.uid}")
            viewModel.setCardItem(card)
            viewModel.getRankItem(card.uid)

        }else{
            finish()
        }
    }

    override fun initListener() {

        subBtn.setOnClickListener {
            viewModel.cardItem.value?.let{
//                val intent = Intent(applicationContext, NameCardActivity::class.java)
                val intent = Intent(applicationContext, CardDetailEditActivity::class.java)
                intent.putExtra(Define.KEYS.NAME_CARD, it as Parcelable)
                startActivityForResult(intent, REQUEST_EDIT)
            }

        }

        btn_message.setOnClickListener { send(Send.SMS) }
        btn_phone.setOnClickListener { send(Send.PHONE) }
        btn_email.setOnClickListener { send(Send.EMAIL) }
        btn_tel.setOnClickListener {send(Send.TEL) }

        btn_add_namecard.setOnClickListener {
            viewModel.cardItem.value?.let { card->
                if (ContactUtil.insertContact(this, card.name, card.hp, card.tel, card.fax, card.email, card.company, card.level, card.address, card.website)) {
                    showToast(String.format("%s님을 주소록에 추가하였습니다.", card.name))
                }
            }

        }

        btn_del_namecard.setOnClickListener {
            viewModel.cardItem.value?.let {
                val di= DialogCustom(this, DiglogItem(
                        "명함삭제",
                        "${it.name} 님의 명함을 삭제하시겠습니까?",
                        "", "삭제"))
                di.setOnDismissListener {
                    if (di.check){
                        viewModel.delNameCard()
                    }
                }
            }
        }

        btn_company_Info.setOnClickListener {
            viewModel.cardItem.value?.let { card->
                val intent = Intent(this, SearchCompanyInfoActivity::class.java)
                if (card.cmpCd > 0) intent.putExtra(Define.KEYS.CMP_CD, card.cmpCd)
                intent.putExtra(Define.KEYS.COMPANY, card.company)
                startActivity(intent)
            }
        }

        btn_memo.setOnClickListener {
            viewModel.cardItem.value?.let { card ->
                val intent = Intent(this, MemoListActivity::class.java)
                intent.putExtra(Define.KEYS.NAME_CARD, card as Parcelable?)
                startActivity(intent)
            }
        }

        btn_close_connection.setOnClickListener {
            mapactivity(Intent(this, GoogleMapActivity::class.java), GoogleMapActivity.MODE_PERSONAL)
        }



        btn_close_company.setOnClickListener {
            mapactivity(Intent(this, GoogleMapActivity::class.java), GoogleMapActivity.MODE_COMPANY)
        }

        btn_rank.setOnClickListener {
            viewModel.rankItem.value?.let { item->
                viewModel.cardItem.value?.let {
                    val intent=Intent(applicationContext, RankEditActivity::class.java)
                    intent.putExtra("rank", item)
                    intent.putExtra("uid", it.uid)
                    startActivityForResult(intent, REQUEST_RANK)
                }
            }
        }

        btn_navi.setOnClickListener {
            onNavigationButtonClick()
        }

        btn_map.setOnClickListener{
            viewModel.cardItem.value?.let { card->
                if (card.latitude > 0 && card.longitude > 0) {
                    val uri = Uri.parse(String.format("geo:%s, %s", card.latitude, card.longitude))

                    var intent = Intent(Intent.ACTION_VIEW, uri)
                    intent.setPackage("com.google.android.apps.maps")
                    if (intent.resolveActivity(packageManager) != null) {
                        startActivity(intent)
                    } else {
                        intent = Intent(Intent.ACTION_VIEW, uri)
                        startActivity(intent)
                    }
                } else if (StringUtil.isNotEmpty(card.address)) {

                    showToast("지역 정보를 확인할 수 없습니다.")


//                    getLocation(card.address)?.let {
//                        card.latitude = it.latitude
//                        card.longitude = it.longitude
//                        if (!openNavigation(card)) {
//                            startActivity(Intent("android.intent.action.VIEW", Uri.parse(String.format("geo:%s,%s?q=%s", card.latitude, card.longitude, card.company))))
//                        }
//                    }?:{
//
//                    }()


                } else {
                    showToast("지역 정보를 확인할 수 없습니다.")
                }
            }
        }
        tv_add_link.setOnClickListener {
            viewModel.cardItem.value?.let {
                if (it.type==11){
                    viewModel.addLink()
                }
            }
        }

    }

    override fun initDatabinding() {
        viewModel.cardItem.observe(this, Observer {
            it?.let { item ->

                tv_name.text = item.name
                tv_company.text = item.company

                var part = item.part
                if (part != "" && item.level != "") {
                    part += " / "
                }
                part += item.level

                tv_part.text = part
                viewDataBinding.tvHp.text = item.hp
                tv_email.text = item.email
                tv_tel.text = item.tel
                tv_address.text = item.address

                layout_link_text.visibility = if (item.type != 10) View.VISIBLE else View.INVISIBLE
                if (item.type == 10) {
                    tv_add_link.text = "Link"
                }


                val df: DateFormat = SimpleDateFormat("yyyy년 MM월 dd일")
                val str: String = df.format(item.signDate * 1000)
                tv_signDate.text = str

                val images = ArrayList<String>()
                if (StringUtil.isNotEmpty(item.image1)) images.add(item.image1) //else images.add("")
                if (StringUtil.isNotEmpty(item.image2)) images.add(item.image2) //else images.add("")
                if (StringUtil.isNotEmpty(item.image3)) images.add(item.image3) //else images.add("")
                adapter!!.setItems(images)
                adapter!!.notifyDataSetChanged()

                // val items = ArrayList<NameCardFragment>()
/*
                try {
                    for (i in item.nameCardImages.indices) {
                        items.add(NameCardFragment.getInstance(i, NameCardFragment.LAYOUT_TYPE_OCR, item))
                    }
                } catch (e: Exception) {
                    LogUtil.e(e)
                }

                val adapter = NameCardPagerAdapter(supportFragmentManager, items)
                viewPager.adapter = adapter
                indicator.setViewPager(viewPager)
                indicator.setOnPageChangeListener(object : OnPageChangeListener {
                    override fun onPageScrolled(position: Int, positionOffset: Float, positionOffsetPixels: Int) {}
                    override fun onPageSelected(position: Int) {}
                    override fun onPageScrollStateChanged(state: Int) {}
                })*/

                if (it.photo != "") {
                    Glide.with(this)
                            .load(it.photo)
                            .error(R.drawable.ic_default_pictory)
                            .circleCrop()
//                        .skipMemoryCache(true)
                            .into(img_photo)
                }

            }
        })

        viewModel.cardDel.observe(this, Observer {
            if (it) {
                setResult(Activity.RESULT_OK)
                finish()
            }
        })

        viewModel.rankItem.observe(this, Observer {
            it?.let {
                logD("rankItem.observe=${it.mgrade + it.closeness}")
                if (it.mgrade != "") {
                    tv_rank.text = it.mgrade + it.closeness
                } else {
                    tv_rank.text = "D1"
                }
            }
        })
    }

    enum class Send{SMS,PHONE,EMAIL,TEL}
    private fun send(send: Send){
        viewModel.cardItem.value?.let {
            when(send){
                Send.SMS -> {
                    if (it.hp != "") {
                        val sendIntent = Intent(Intent.ACTION_SENDTO, Uri.parse(String.format("sms:%s", it.hp)))
                        startActivity(sendIntent)
                    } else {
                        showToast("휴대폰 번호가 존재하지 않습니다.")
                    }
                }
                Send.PHONE -> {
                    if (it.hp != "") {
                        val intent = Intent(Intent.ACTION_DIAL, Uri.parse(String.format("tel:%s", it.hp)))
                        startActivity(intent)
                    } else {
                        showToast("휴대폰 번호가 존재하지 않습니다.")
                    }
                }
                Send.EMAIL -> {
                    if (it.email != "") {
                        val intent = Intent(Intent.ACTION_SEND)
                        intent.type = "plain/text"
                        intent.putExtra(Intent.EXTRA_EMAIL, arrayOf<String>(it.email))
                        intent.type = "message/rfc822"
                        startActivity(Intent.createChooser(intent, "Email Choose"))
                    } else {
                        showToast("이메일 주소가 존재하지 않습니다.")
                    }
                }
                Send.TEL -> {
                    if (it.tel != "") {
                        val intent = Intent(Intent.ACTION_DIAL, Uri.parse(String.format("tel:%s", it.tel)))
                        startActivity(intent)
                    } else {
                        showToast("유선전화 번호가 존재하지 않습니다.")
                    }
                }
            }
        }
    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode==Activity.RESULT_OK ){

            when(requestCode){
                REQUEST_RANK -> {
                    viewModel.cardItem.value?.let {
                        viewModel.getRankItem(it.uid)
                    }
                }
                REQUEST_EDIT -> {
                    data?.getParcelableExtra<NameCard>("carditem")?.let {
                        viewModel.setCardItem(it)
                    }

                }
            }
        }
    }
    fun mapactivity(intent : Intent, mode : Int ){
        viewModel.cardItem.value?.let { card ->
            intent.putExtra(Define.KEYS.NAME_CARD, card as Parcelable?)
            intent.putExtra(Define.KEYS.MODE, mode)
            startActivity(intent)
        }

    }






    fun onNavigationButtonClick() {
        viewModel.cardItem.value?.let { card->
            if (card.latitude > 0 && card.longitude > 0) {
                if (!openNavigation(card)) {
                    var findword = if (StringUtil.isNotEmpty(card.address)) {card.address } else {card.company}
                    Log.d(TAG, "onNavigationButtonClick: card.latitude : ${card.latitude}, card.longitude: ${card.longitude}, card.company : ${findword}")
                    startActivity(Intent("android.intent.action.VIEW", Uri.parse(String.format("geo:%s,%s?q=%s", card.latitude, card.longitude, card.company))))
                }
            } else if (StringUtil.isNotEmpty(card.address)) {

                showToast("지역 정보를 확인할 수 없습니다.")

//                getLocation(card.address)?.let {
//                    card.latitude = it.latitude
//                    card.longitude = it.longitude
//                    if (!openNavigation(card)) {
//                        startActivity(Intent("android.intent.action.VIEW", Uri.parse(String.format("geo:%s,%s?q=%s", card.latitude, card.longitude, card.company))))
//                    }
//                }?:{
//                    showToast("지역 정보를 확인할 수 없습니다.")
//                }()

            } else {
                showToast("지역 정보를 확인할 수 없습니다.")
            }
        }
    }
    private val navigations = arrayOf("com.skt.skaf.l001mtm091", "com.skt.tmap.ku", "kt.navi", "com.lguplus.navi", "com.nhn.android.nmap")

    private fun openNavigation(card: NameCard): Boolean {
        val intent: Intent
        val uri: Uri
        var findword = if (StringUtil.isNotEmpty(card.address)) {card.address } else {card.company}
        if (isInstallApp(navigations.get(0))) {   //t map 전용맵
            uri = Uri.parse(String.format("tmap://route?goalx=%s&goaly=%s&goalname=%s", card.longitude, card.latitude, findword))
            intent = Intent(Intent.ACTION_VIEW, uri)
            intent.setPackage(navigations.get(0))
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
            return true
        }
        if (isInstallApp(navigations.get(1))) {   //t map 공용맵
            uri = Uri.parse(String.format("tmap://route?goalx=%s&goaly=%s&goalname=%s", card.longitude, card.latitude, findword))
            intent = Intent(Intent.ACTION_VIEW, uri)
            intent.setPackage(navigations.get(1))
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
            return true
        }
        if (isInstallApp(navigations.get(2))) {   //원나비
            uri = Uri.parse(String.format("geo:%s,%s?q=%s", card.latitude, card.longitude, findword))
            intent = Intent(Intent.ACTION_VIEW, uri)
            intent.setPackage(navigations.get(2))
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
            return true
        }
        if (isInstallApp(navigations.get(3))) {   //uplus 나비
            uri = Uri.parse(String.format("geo:%s,%s?q=%s", card.latitude, card.longitude, findword))
            intent = Intent(Intent.ACTION_VIEW, uri)
            intent.setPackage(navigations.get(3))
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
            return true
        }
//        if(isInstallApp(navigations[4])){   //uplus 나비
//            uri = Uri.parse(String.format("navermaps://?menu=location&pinType=place&lat=%s&lng=%s&title=%s\"", card.latitude, card.longitude, card.company));
//            intent = Intent(Intent.ACTION_VIEW, uri)
//            intent.setPackage(navigations[3]);
//            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//            startActivity(intent);
//            return true;
//        }
        return false
    }

    private fun isInstallApp(packageName: String): Boolean {
        val intent = packageManager.getLaunchIntentForPackage(packageName)
        return intent != null
    }

    override fun onItemClick(position: Int) {
        val intent = Intent(this, NameCardImageActivity::class.java)
        intent.putExtra(Define.KEYS.URL, adapter!!.getItem(position))
        startActivity(intent)
    }


//    private fun getLocation(address: String): Address? {
//        return try {
//            val list: List<Address> = geocoder.getFromLocationName(address, 1)
//            list[0]
//        } catch (e: Exception) {
//            LogUtil.e(e)
//            null
//        }
//    }


}