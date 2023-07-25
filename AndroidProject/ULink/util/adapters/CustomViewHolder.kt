package com.bsni.nameq.v2.util.adapters


import android.view.View
import androidx.recyclerview.widget.RecyclerView

abstract class CustomViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
    abstract fun init(item: Any)
}