package com.bsni.nameq.v2.view.main.mypage


import android.app.Activity
import android.content.Intent
import com.bsni.nameq.R
import com.bsni.nameq.activities.enterprise.SearchCompanyInfoActivity
import com.bsni.nameq.common.GlobalApplication
import com.bsni.nameq.common.Define
import com.bsni.nameq.databinding.ActivityMyProfileEditBinding
import com.bsni.nameq.objects.Account
import com.bsni.nameq.objects.api.Company
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.item.mypage.MyInfoItem
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.viewmodel.main.mypage.MyProfileEditViewModel
import com.bumptech.glide.Glide
import kotlinx.android.synthetic.main.activity_my_profile_edit.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class MyProfileEditActivity : ActivityBase<ActivityMyProfileEditBinding, MyProfileEditViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.activity_my_profile_edit

    override val viewModel: MyProfileEditViewModel by viewModel()

    companion object{
        const val REQUEST_SEARCH_COMPANY = 100
    }

    override fun init() {

        tvTitle.text = "프로필 수정"
        subBtn.text = "초기화"

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
            subBtn.setTextColor(resources.getColor(R.color.black, theme))
        } else {
            subBtn.setTextColor(resources.getColor(R.color.black))
        }

        if (intent.hasExtra("item")) {
            val myInfoItem: MyInfoItem = intent.getSerializableExtra("item") as MyInfoItem
            logD("MyInfoItem.uid=${myInfoItem.name}")
            viewModel.setMyInfoItem(myInfoItem)
        }
    }

    override fun initListener() {

        btn_send.setOnClickListener {
            var profile: Account.Profile = GlobalApplication.account.profile.clone()
            profile.name = ed_name.text.toString().trim()
            profile.hp = ed_phone.text.toString().trim()
            profile.email = ed_email.text.toString().trim()
            profile.company = ed_company.text.toString().trim()
            profile.part = ed_part.text.toString().trim()
            profile.level = ed_level.text.toString().trim()
            profile.tel = ed_tel.text.toString().trim()
            profile.fax = ed_fax.text.toString().trim()
            profile.address = ed_address.text.toString().trim()


            selectedCompany?.let {
                profile.cert_num = selectedCompany?.bz_ins_no
                profile.website = ""
                profile.typeb = 2
                profile.city = 1
                profile.introduce = ""
                profile.main_business = ""
                profile.birthday = ""
            }?:{
                profile.cert_num = if (profile.cert_num == null) "" else profile.cert_num
                profile.website = if (profile.website == null) "" else profile.website
                profile.introduce = if (profile.introduce == null) "" else profile.introduce
                profile.main_business = if (profile.main_business == null) "" else profile.main_business
                profile.birthday = if (profile.birthday == null) "" else profile.birthday
            }()
            viewModel.edityProfile(profile)
        }

        subBtn.setOnClickListener {
            viewModel.setMyInfoItem(MyInfoItem())
        }

        btn_back.setOnClickListener {
            showDialog()
        }

        btn_search.setOnClickListener {
            val intent = Intent(this, SearchCompanyInfoActivity::class.java)
            intent.putExtra(Define.KEYS.COMPANY, ed_company.text.toString().trim())
            intent.putExtra(Define.KEYS.MODE, SearchCompanyInfoActivity.MODE_GET_COMPANY_INFO)
            startActivityForResult(intent, REQUEST_SEARCH_COMPANY)
        }
    }


    override fun onBackPressed() {
        showDialog()
    }

    private fun showDialog() {
        viewModel.check.value?.let {
            if (!it) {
                val dc = DialogCustom(this, DiglogItem("My 프로필 편집", "편집을 종료하시겠습니까?\n" +
                        "저장하지 않은 내용은 삭제됩니다.", "", "종료"))
                dc.setOnDismissListener {
                    if (dc.check) {
                        finish()
                    }
                }
            }
        }


    }

    override fun initDatabinding() {
        viewModel.myInfoItem.observe(this, { item ->
            item?.let {
                ed_name.setText(item.name)
                ed_level.setText(item.level)
                ed_part.setText(item.part)
                ed_company.setText(item.company)
                ed_phone.setText(item.hp)
                ed_email.setText(item.email)
                ed_tel.setText(item.tel)
                ed_fax.setText(item.fax)
                ed_address.setText(item.address)

                if (it.photo1 != "") {
                    Glide.with(this)
                            .load(it.photo1)
                            .circleCrop()
                            .error(R.drawable.ic_default_pictory)
//                        .skipMemoryCache(true)
                            .into(image_photo)
                } else {
                    image_photo.setImageResource(R.drawable.ic_default_pictory)
                }

                if (it.vcardImage1 != "") {
                    Glide.with(this)
                            .load(it.vcardImage1)
//                        .skipMemoryCache(true)
                            .error(R.drawable.bg_name_card_template_04)
                            .into(img_card)
                } else {
                    img_card.setImageResource(R.drawable.bg_name_card_template_04)
                }
            }
        })

        viewModel.check.observe(this,{
            it.let {
                if (it){
                    setResult(RESULT_OK)
                    finish()
                }
            }
        })
        viewModel.msg.observe(this,{
            showToast(it)
        })
    }

    var selectedCompany:Company?=null

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode==Activity.RESULT_OK && requestCode==REQUEST_SEARCH_COMPANY){
            selectedCompany = data!!.getSerializableExtra(Define.KEYS.COMPANY) as Company?
        }
    }
}
