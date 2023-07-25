package com.bsni.nameq.v2.view.main.report


import android.content.Intent
import androidx.core.view.isVisible
import com.bsni.nameq.R
import com.bsni.nameq.databinding.ActivityGroupSelectBinding
import com.bsni.nameq.models.database.NameCard
import com.bsni.nameq.v2.dialog.DialogCustom
import com.bsni.nameq.v2.dialog.DiglogItem
import com.bsni.nameq.v2.util.adapters.Adapters
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.viewmodel.main.mypage.GroupSelectActivityViewModel
import kotlinx.android.synthetic.main.activity_group_select.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class GroupSelectActivity : ActivityBase<ActivityGroupSelectBinding, GroupSelectActivityViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.activity_group_select

    companion object {
        const val REQUEST_SELECT_NAMECARD = 110
        const val ADD_GROUP_MEMBER = 111
    }

    override val viewModel: GroupSelectActivityViewModel by viewModel()

    override fun init() {


        if(intent.hasExtra("group_type")){
            if(intent.getBooleanExtra("group_type",false)){
                list.adapter=Adapters(R.layout.item_company_group, ArrayList())
            }else{
                list.adapter=Adapters(R.layout.item_group, ArrayList())
            }
            viewModel.setType(intent.getBooleanExtra("group_type",false))


        }else{
            viewModel.setType(false)
            list.adapter=Adapters(R.layout.item_group, ArrayList())
        }

    }

    override fun initListener() {


            (list.adapter as Adapters).onListClickListener{ _, po->
                viewModel.type.value?.let {
                    if (it){
                        viewModel.groupCompanyItems.value?.let{groupcCompany->
                            val intent=Intent(this,NameCardSelectActivity::class.java)
                            intent.putExtra("ocuid",groupcCompany[po].ocuid)
                            startActivityForResult(intent,REQUEST_SELECT_NAMECARD)
                        }
                    }else{
                        viewModel.groupItems.value?.let {
                            val intent=Intent(this,NameCardSelectActivity::class.java)
                            intent.putExtra("group_idx",it[po].uid)
                            startActivityForResult(intent,REQUEST_SELECT_NAMECARD)
                        }
                    }
                }
            }

            (list.adapter as Adapters).onCallbackTypeListener { position, type, _ ->

                when(type){
                    Adapters.ADAPTERTYPE.MEMBERADD->{
                        viewModel.groupCompanyItems.value?.let{
                            viewModel.isEdit()

                            viewModel.groupCompanyItem=it[position]
                            val intent=Intent(this,NameCardSelectActivity::class.java)
                            intent.putExtra("ocuid", -1)    //회사 전체
                            startActivityForResult(intent,ADD_GROUP_MEMBER)
                        }

                    }
                    Adapters.ADAPTERTYPE.EDIT->{
                        viewModel.groupCompanyItems.value?.let {
//                            viewModel.putCompanyGroup(it[position])
                        }

                    }
                    Adapters.ADAPTERTYPE.DEL->{

                        viewModel.groupCompanyItems.value?.let {
                            viewModel.delCompanyGroup(it[position])
                        }

                    }
                }
            }


        subBtn.setOnClickListener {
            viewModel.isEdit()
        }

        btn_add_group.setOnClickListener {
            val di=DialogCustom( this, DiglogItem("그룹 생성",editHint = "그룹이름을 입력하세요"))
            di.setOnDismissListener {
                if (di.check){
                    viewModel.addCompanyGroup(di.res)
                }

            }
        }

    }

    override fun initDatabinding() {
        viewModel.groupItems.observe(this,{
            it?.let {
                (list.adapter as Adapters).setItems(it)
            }
        })

        viewModel.groupCompanyItems.observe(this,{
            it?.let {
                (list.adapter as Adapters).setItems(it)
            }
        })

        viewModel.type.observe(this,{
            it?.let {
                if (it){
                    tvTitle.text="회사 공유 그룹"
                    viewModel.getCompanyGroup()
                    subBtn.text="편집"
                    btn_add_group.isVisible=true

                }else{
                    tvTitle.text="공유 그룹"
                    viewModel.getGroup()
                    btn_add_group.isVisible=false

                }
            }
        })

        viewModel.isEdit.observe(this,  {
            viewModel.type.value?.let { type->
                if (type){
                    var color:Int=R.color.black
                    if (it){
                        subBtn.text="수정"
                        color=R.color.main
                    }else{
                        subBtn.text="편집"
                    }

                    list.isEnabled=it
                    btn_add_group.isVisible=!it

                    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
                        subBtn.setTextColor(resources.getColor(color,theme))
                    }else{
                        subBtn.setTextColor(resources.getColor(color))
                    }
                    (list.adapter as Adapters).setItems1(it)
                }
            }

        })



    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode== RESULT_OK){
            when(requestCode){
                REQUEST_SELECT_NAMECARD->{
                    setResult(RESULT_OK,data)
                    finish()
                }
                ADD_GROUP_MEMBER->{
                    data?.let {
                        val items=it.getSerializableExtra("items") as ArrayList<NameCard>
                        viewModel.addGroupCompanyMember(items)
                    }

                }
            }
        }

    }
}
