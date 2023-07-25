package com.bsni.nameq.v2.view.main.mynamecard

import androidx.lifecycle.Observer
import com.bsni.nameq.R
import com.bsni.nameq.databinding.ActivityRankEditBinding
import com.bsni.nameq.v2.item.RankItem
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.viewmodel.main.mynamecard.RankEditViewModel
import kotlinx.android.synthetic.main.activity_rank_edit.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class RankEditActivity : ActivityBase<ActivityRankEditBinding, RankEditViewModel>() {


    override val layoutResourceId: Int
        get() = R.layout.activity_rank_edit
    override val viewModel: RankEditViewModel by viewModel()


    override fun init() {
        tvTitle.text="고객등급 / 친밀도 설정"
        if (intent.hasExtra("rank")){
            intent.getParcelableExtra<RankItem>("rank")?.let { viewModel.setRankItem(it) }
            viewModel.uid=intent.getIntExtra("uid",0)
        }else{
            finish()
        }

    }

    override fun initListener() {
        cancel.setOnClickListener {
            finish()
        }

        send.setOnClickListener {
            viewModel.rankItem.value?.let {
                viewModel.putEditRank(rgCloseness.checkedRadioButtonId,rgGrade.checkedRadioButtonId)
            }?:{
                viewModel.setEditRank(rgCloseness.checkedRadioButtonId,rgGrade.checkedRadioButtonId)
            }()

        }
    }



    override fun initDatabinding() {
        viewModel.rankItem.observe(this, Observer {
            it?.let {
                when(it.closeness){
                    "1"->{rbCloseness1.isChecked=true}
                    "2"->{rbCloseness2.isChecked=true}
                    "3"->{rbCloseness3.isChecked=true}
                    "4"->{rbCloseness4.isChecked=true}
                    "5"->{rbCloseness5.isChecked=true}
                }

                when(it.mgrade){
                    "A"->{rbGrade1.isChecked=true}
                    "B"->{rbGrade2.isChecked=true}
                    "C"->{rbGrade3.isChecked=true}
                    "D"->{rbGrade4.isChecked=true}
                }
            }
        })

        viewModel.check.observe(this, Observer {
            it?.let {
                if (it){
                    setResult(RESULT_OK)
                    finish()
                }else{
                    showToast("잠시후 다시 시도 하세요!")
                }
            }
        })
    }
}