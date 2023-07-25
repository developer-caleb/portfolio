package com.bsni.nameq.v2.view.join

import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.Toast
import androidx.lifecycle.Observer
import com.bsni.nameq.R
import com.bsni.nameq.databinding.ActivityCertificationBinding
import com.bsni.nameq.v2.util.adapters.SpinnerAdapter
import com.bsni.nameq.v2.util.basic.ActivityBase
import com.bsni.nameq.v2.util.common.logD
import com.bsni.nameq.v2.viewmodel.CertificationViewModel
import kotlinx.android.synthetic.main.activity_certification.*
import kotlinx.android.synthetic.main.top_layout.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CertificationActivity : ActivityBase<ActivityCertificationBinding, CertificationViewModel>() {

    override val layoutResourceId: Int
        get() = R.layout.activity_certification
    override val viewModel: CertificationViewModel by viewModel()

    override fun init() {
        tvTitle.text="회원가입 (2/3)"
        val spinnerAdapter=SpinnerAdapter(this, viewModel.phNum, R.layout.spinner_item, R.layout.spinner_item_dropdown)
        phoneSp.adapter=spinnerAdapter

    }

    override fun initListener() {
        etPhone.addTextChangedListener(object : TextWatcher{
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}

            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}

            override fun afterTextChanged(s: Editable?) {
                photnBtn.isEnabled = s.toString().length >= 7
            }
        })

        /* todo
            인증번호 일단 4자리로 나중에 변경시 수정
         */

        etNum.addTextChangedListener(object : TextWatcher{
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable?) {
                checkBtn.isEnabled = s.toString().length == 4
            }
        })

        photnBtn.setOnClickListener {
            // todo api 확인 후 해야할듯
            viewModel.certificationError.postValue("인증번호가 발송되었습니다.")

            //시간 표기
            viewModel.startTimer()
        }

        /* todo
            인증후 확인 활성화
         */
        checkBtn.setOnClickListener {
            viewModel.certification.postValue(true)
            //todo api 확인 후 해야할듯
           viewModel.certificationError.postValue("인증번호가 일치하지 않습니다. ")
//           viewModel.certificationError.postValue("인증이 완료되었습니다.")
        }



        send.setOnClickListener {
            if (etName.text!!.isNotEmpty()){
                logD("aaaa")
            }else{
                Toast.makeText(this,"이름을 입력하세요!",Toast.LENGTH_LONG).show()
            }
        }


    }

    override fun initDatabinding() {
        viewModel.certification.observe(this, Observer {
            if (it){
                send.isEnabled=true
            }
        })
        viewModel.certificationError.observe(this, Observer {
            if (it.isNotEmpty()){
                checkBtnError.visibility= View.VISIBLE
                checkBtnError.text=it
            }else{
                checkBtnError.text=""
                checkBtnError.visibility= View.GONE
            }
        })
        viewModel.timeStr.observe(this, Observer {
            timerStr.visibility=View.VISIBLE
            timerStr.text=it
        })
    }
}