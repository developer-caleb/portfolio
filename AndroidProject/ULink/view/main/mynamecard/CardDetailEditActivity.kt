package com.bsni.nameq.v2.view.main.mynamecard

import android.content.Intent
import android.os.Parcelable
import androidx.lifecycle.Observer
import com.bsni.nameq.R
import com.bsni.nameq.common.Define
import com.bsni.nameq.databinding.ActivityCardDetailEditBinding
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.viewmodel.main.mynamecard.CardDetailEditViewModel
import com.bumptech.glide.Glide
import kotlinx.android.synthetic.main.activity_card_detail_edit.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CardDetailEditActivity : ActivityBase<ActivityCardDetailEditBinding, CardDetailEditViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.activity_card_detail_edit
    override val viewModel: CardDetailEditViewModel by viewModel()

    override fun init() {
        tvTitle.text="명함 수정"
        subBtn.text="저장"
        if (intent.hasExtra(Define.KEYS.NAME_CARD)){
            val card : NameCard = intent.getParcelableExtra<NameCard>(Define.KEYS.NAME_CARD) as NameCard
            logD("card.uid=${card.uid}")
            viewModel.setCardItem(card)

        }else{
            finish()
        }

    }

    override fun initListener() {
        subBtn.setOnClickListener {
            var item=viewModel.cardItem.value
            item?.let {
                it.name=ed_name.text.toString()
                it.level=ed_level.text.toString()
                it.part=ed_part.text.toString()
                it.company=ed_company.text.toString()
                it.hp=ed_phone.text.toString()
                it.email=ed_email.text.toString()
                it.tel=ed_tel.text.toString()
                it.fax=ed_fax.text.toString()
                it.address=ed_address.text.toString()
                viewModel.updata(item)
            }

        }
    }

    override fun initDatabinding() {
        viewModel.cardItem.observe(this, Observer {
            it?.let {item->
                ed_name.setText(item.name)
                ed_level.setText(item.level)
                ed_part.setText(item.part)
                ed_company.setText(item.company)
                ed_phone.setText(item.hp)
                ed_email.setText(item.email)
                ed_tel.setText(item.tel)
                ed_fax.setText(item.fax)
                ed_address.setText(item.address)

                if (it.photo != "") {
                    Glide.with(this)
                            .load(it.photo)
//                        .skipMemoryCache(true)
                            .centerCrop()
                            .into(image_photo)
                }

                if (it.image1 != "") {
                    Glide.with(this)
                            .load(it.image1)
//                        .skipMemoryCache(true)
                            .into(img_card)
                }
            }
        })

        viewModel.check.observe(this, Observer {
            it.let {check->
                if (check){
                    viewModel.cardItem.value?.let {nameCard ->
                        val intent = Intent().apply {
                            putExtra("carditem",nameCard as Parcelable)
                        }
                        setResult(RESULT_OK,intent)
                        finish()
                    }

                }
            }
        })
    }
}