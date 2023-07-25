package com.bsni.nameq.v2.util.adapters

import android.content.Context
import android.os.Build
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.TextView
import androidx.annotation.RequiresApi
import com.bsni.nameq.R


class SpinnerAdapter(context: Context, var items:ArrayList<String>, val layout:Int, private val dropDownlayout:Int): ArrayAdapter<String>(context,layout,dropDownlayout) {


    override fun getItem(position: Int): String {
        return items[position]
    }

    override fun getCount(): Int {
        return items.size
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        var view = convertView
        if (view == null) {
            view = LayoutInflater.from(parent.context).inflate(layout, parent, false)
        }
        view?.findViewById<TextView>(R.id.text)?.text = items[position]

        return view!!
    }




    override fun getDropDownView(position: Int, convertView: View?, parent: ViewGroup): View {

        var view = convertView
        if (view == null) {
            view = LayoutInflater.from(parent.context).inflate(dropDownlayout, parent, false)
        }
        if(dropDownlayout==R.layout.spinner_item_cardlist_dropdown){

            val bgVal:Int=when(position){
                0->R.drawable.spinner_drop_bg1
                1->R.drawable.spinner_drop_bg2
                2->R.drawable.spinner_drop_bg3
                else -> R.drawable.spinner_drop_bg1
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                view?.background=context.getDrawable(bgVal)
            }else{
                view?.background=context.resources.getDrawable(bgVal)
            }


        }

        view?.findViewById<TextView>(R.id.text)?.text = items.get(position)
        return view!!
    }



}