package com.bsni.nameq.v2.util.adapters.viewpager

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Color
import android.util.Log
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import com.bsni.nameq.R
import com.bsni.nameq.interfaces.DragListener
import com.bsni.nameq.models.database.MyMenu
import java.util.*
import kotlin.collections.ArrayList

class DragableReclerViewAdapter(private val data: ArrayList<MyMenu>,
                                private val mDragListener: DragListener
) : RecyclerView.Adapter<DragableReclerViewAdapter.MyViewHolder>(),
    ItemMoveCallback.ItemTouchHelperContract {
    lateinit var context : Context
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        val itemView = LayoutInflater.from(parent.context).inflate(R.layout.item_icon, parent, false)
        context = parent.context
        return MyViewHolder(itemView)
    }

    @SuppressLint("ClickableViewAccessibility")
    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        holder.mTitle.text = data[position].shortname
        holder.favorite_img.setImageDrawable(ContextCompat.getDrawable( context , data[position].image))
        holder.rowView.setOnTouchListener { _, event ->
            if (event.action == MotionEvent.ACTION_DOWN) {
                mDragListener.requestDrag(holder) }
            Log.d("DRAGABLERECYCLER", "onBindViewHolder: ${event.action}")
            true
        }

        /*holder.favorite_img.setOnTouchListener { _, event ->

            if (event.action == MotionEvent.ACTION_DOWN) {
                mDragListener.requestDrag(holder)
            }
            false
        }*/
    }

    override fun getItemCount(): Int {
        return data.size
    }

    override fun onRowMoved(fromPosition: Int, toPosition: Int) {
        if (fromPosition < toPosition) {
            for (i in fromPosition until toPosition) {
                Collections.swap(data, i, i + 1)
            }
        } else {
            for (i in fromPosition downTo toPosition + 1) {
                Collections.swap(data, i, i - 1)
            }
        }
        notifyItemMoved(fromPosition, toPosition)
    }

    override fun onRowSelected(myViewHolder: MyViewHolder) {
        myViewHolder.rowView.setBackgroundColor(Color.GRAY)
    }

    override fun onRowClear(holder: MyViewHolder) {
        holder.rowView.setBackgroundColor(Color.WHITE)
        mDragListener.endDrag(holder)
    }
    fun additem(item : MyMenu)
    {
        data.add(item)
        notifyDataSetChanged()
    }
    fun removeItem(position : Int)
    {
        data.removeAt(position)
        notifyDataSetChanged()
    }
    inner class MyViewHolder(var rowView: View) : RecyclerView.ViewHolder(rowView) {
        val mTitle: TextView = itemView.findViewById(R.id.favorite_text)
        var favorite_img: ImageView = itemView.findViewById(R.id.favorite_img)
    }
}