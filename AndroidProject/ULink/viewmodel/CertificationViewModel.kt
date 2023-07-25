package com.bsni.nameq.v2.viewmodel

import android.os.CountDownTimer
import androidx.lifecycle.MutableLiveData
import com.bsni.nameq.v2.util.basic.ViewModelBasic
import java.security.Timestamp
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList

class CertificationViewModel: ViewModelBasic() {

    val phNum=ArrayList<String>()
    var certification = MutableLiveData<Boolean>(false)
    var certificationError = MutableLiveData<String>("")
    var timeStr = MutableLiveData<String>("")
    var time:Long=0L

    private val timer:CountDownTimer


    init{
        phNum.addAll(arrayOf("010","011","016","017","018"))
        timer= object : CountDownTimer(180000L,1000L) {
            override fun onTick(millisUntilFinished: Long) {
                time=millisUntilFinished
                val pattern = "mm:ss"
                val formatter =  SimpleDateFormat(pattern)
//                val date = (String) formatter.format( Timestamp(mills));
                val date = formatter.format(Date(millisUntilFinished))


//                timeStr.postValue((millisUntilFinished/1000).toString())
                timeStr.postValue(date)
            }

            override fun onFinish() {

            }

        }
    }


    fun startTimer(){
        timer.cancel()
        timer.start()
    }



}