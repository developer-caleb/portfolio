package com.bsni.nameq.v2.view.main.mypage

import android.util.Log
import androidx.core.view.isVisible
import com.bsni.nameq.R
import com.bsni.nameq.v3.mypage.CardImageAdapter
import com.bsni.nameq.databinding.MyProfileFragmentBinding
import com.bsni.nameq.v2.item.mypage.MyInfoItem
import com.bsni.nameq.v2.util.adapters.viewpager.ImgViewPage
import com.bsni.nameq.v2.util.basic.FragmentBase
import com.bsni.nameq.v2.viewmodel.main.mypage.MyProfileViewModel
import com.bumptech.glide.Glide
import com.bumptech.glide.load.engine.DiskCacheStrategy
import kotlinx.android.synthetic.main.my_profile_fragment.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class MyProfileFragment : FragmentBase<MyProfileFragmentBinding, MyProfileViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.my_profile_fragment
    override val viewModel: MyProfileViewModel by viewModel()
    val TAG : String = "MyProfileFragment.kt"
    var adapter: CardImageAdapter?=null

    companion object {
        @JvmStatic
        val instance: MyProfileFragment = MyProfileFragment()
    }

    override fun init() {
        nestedScrollView.isFillViewport=true
        viewModel.getMyInfo()


    }

    fun getMyInfo(): MyInfoItem? {
        return viewModel.myInfoItem.value
    }

    override fun initListener() {

    }

    override fun initLiveData() {

        viewModel.myInfoItem.observe(this, {
            it?.let {
                Log.d("TAG", "initLiveData: 함수 호출!2")
                val arr = ArrayList<String>()
                if (it.vcardImage1 != "") {
                    arr.add(it.vcardImage1)
                }
                if (it.vcardImage2 != "") {
                    arr.add(it.vcardImage2)
                }
                if (it.vcardImage3 != "") {
                    arr.add(it.vcardImage3)
                }

                if (arr.size > 0) {
                    layout_no_namecard.isVisible = false
                    viewPager_layout.isVisible = true

                    viewPager.adapter = ImgViewPage(context!!, arr)

                    adapter?.let { adp ->
                        adp.setItems(arr)
                        adp.notifyDataSetChanged()
                    }

                } else {
                    //데이터가 없을 경우;
                    layout_no_namecard.isVisible = true
                    viewPager_layout.isVisible = false

                }

                tv_name.text = it.name
                tv_partandlevel.text = it.level
                tv_company.text = it.company
                tv_hp.text = it.hp
                tv_email.text = it.email
                tv_tel.text = it.tel
                tv_fax.text = it.fax
                tv_address.text = it.address

                Glide.with(this)
                        .load(it.photo1)
                        .circleCrop()
                        .error(R.drawable.ic_add_pictory)
                        .diskCacheStrategy(DiskCacheStrategy.DATA)
                        .into(img_profile)
            }
            if (it == null) {
                Log.d(TAG , "initLiveData: 데이터가 없습니다.")
                sendmycard.isVisible = false
                layout_no_namecard.isVisible = true
                viewPager_layout.isVisible = false
            }

        })
    }
}
