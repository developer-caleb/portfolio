package com.bsni.nameq.v2.util.adapters.viewpager

import android.content.Context
import android.content.Intent
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import androidx.viewpager.widget.PagerAdapter
import androidx.viewpager.widget.ViewPager
import com.bsni.nameq.R
import com.bsni.nameq.activities.namecard.views.NameCardImageActivity
import com.bsni.nameq.common.Define
import com.bsni.nameq.v2.util.common.logD
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import java.util.*

class ImgViewPage(val context: Context, private val imgArr: ArrayList<String>) : PagerAdapter() {
    private val TAG = "ImgViewPage"


    override fun getCount(): Int {
        return imgArr.size
    }

    override fun instantiateItem(pager: ViewGroup, position: Int): Any {

        var view = View.inflate(context, R.layout.list_img, null)
        val page_img = view.findViewById<View>(R.id.img) as ImageView
        view.setOnClickListener(View.OnClickListener {
            val intent = Intent(context, NameCardImageActivity::class.java)
            intent.putExtra(Define.KEYS.URL, imgArr[position])
            context.startActivity(intent)
        })

        Glide.with(context)
                .load(imgArr[position])
                .transition(DrawableTransitionOptions().crossFade())
                .fitCenter()
                .into(page_img)

        if (view != null) {
            pager.addView(view)
        }
        logD("position=${position}")
        return view!!
    }

    override fun isViewFromObject(view: View, any: Any): Boolean {
        return view == any as LinearLayout
    }

    override fun destroyItem(container: ViewGroup, position: Int, any: Any) {
        (container as ViewPager).removeView(any as View)
    }



}