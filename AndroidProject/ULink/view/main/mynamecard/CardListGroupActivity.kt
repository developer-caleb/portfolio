package com.bsni.nameq.v2.view.main.mynamecard

import android.content.Intent
import android.util.Log
import android.view.View
import androidx.core.view.isVisible
import androidx.lifecycle.Observer
import com.bsni.nameq.R
import com.bsni.nameq.databinding.ActivityCardListGroupBinding
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.viewmodel.main.mynamecard.CardListGroupViewModel
import kotlinx.android.synthetic.main.activity_card_list_group.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CardListGroupActivity : ActivityBase<ActivityCardListGroupBinding,CardListGroupViewModel>() {
    var TAG = "CardListGroupActivity"
    override val layoutResourceId: Int
        get() = R.layout.activity_card_list_group
    override val viewModel: CardListGroupViewModel by viewModel()

    val adapters: Adapters = Adapters(R.layout.item_group, ArrayList())

    override fun init() {
        tvTitle.text="그룹 선택"
        group_list.adapter= adapters
        if (intent.hasExtra("items")){
            viewModel.type=CardListGroupViewModel.TYPE.SELECT
            viewModel.items=intent.getSerializableExtra("items") as ArrayList<NameCard>
            subBtn.visibility= View.GONE

        }else{
            subBtn.text="편집"
            subBtn.visibility= View.VISIBLE
        }

        viewModel.getGroupList()
    }

    override fun initListener() {

        subBtn.setOnClickListener {
            viewModel.isEdit()
        }

        btn_add_group.setOnClickListener {

            val di=DialogCustom(this,
                    DiglogItem(
                            "그룹 추가",
                            "",
                            "그룹 이름","추가"
                    )
            )
            di.setOnDismissListener {

                if (di.check){
                    logD("DialogCustom=${di.res}")
                    viewModel.addGroupItem(di.res)
                }
            }
        }

        adapters.onListClickListener { _, position ->
            if (!viewModel.isEdit.value!!){
                //명함분류에서 명함 추가시킴
                if (viewModel.items.size > 0){
                    viewModel.groupItems.value?.let{
                        viewModel.addGroupNameCard(it[position])

                    }


                }else{
                    //명함그룹 수정에서 명함 그룹 클릭하면 그 명함그룹으로 이동함
                    val intent=Intent()
                    logD("return=${viewModel.groupItems.value?.get(position)}")
                    intent.putExtra("group", viewModel.groupItems.value?.get(position))
                    setResult(RESULT_OK,intent)
                    finish()
                }

            }
        }
        //수정,삭제
        adapters.onCallbackListener { position, check,name ->
            Log.d(TAG, "init: position2=> position ${position}" +
                    "check ${check}" +
                    "name ${name} ")
            if (check){
                //수정
                viewModel.putGroupItem(position,name)
            }else{
                //삭제
                viewModel.delGroupItem(position)
            }
        }
    }

    override fun onBackPressed() {
        //super.onBackPressed()
        val intent=Intent()
        logD("return=${viewModel.groupItems.value?.get(0)}")
        intent.putExtra("group", viewModel.groupItems.value?.get(0))
        setResult(RESULT_OK,intent)
        finish()
    }

    override fun initDatabinding() {
        viewModel.isEdit.observe(this, Observer {
            var color:Int=R.color.black
            if (it){
                subBtn.text="수정"
                color=R.color.main
            }else{
                subBtn.text="편집"
            }

            group_list.isEnabled=it
            btn_add_group.isVisible=!it

            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
                subBtn.setTextColor(resources.getColor(color,theme))
            }else{
                subBtn.setTextColor(resources.getColor(color))
            }
            adapters.setItems1(it)
        })

        viewModel.groupItems.observe(this,  {
            adapters.setItems(it)
        })

        viewModel.isEnd.observe(this,{
            it?.let {
                if (it){
                    finish()
                }
            }
        })
    }
}