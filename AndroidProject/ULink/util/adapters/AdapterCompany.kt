package com.bsni.nameq.v2.util.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.annotation.NonNull
import androidx.recyclerview.widget.RecyclerView
import com.bsni.nameq.R
import com.bsni.nameq.v2.holder.*


class AdapterCompany(var layout: Int, private var items: ArrayList<out Any>) : RecyclerView.Adapter<CustomViewHolder>() {


    private var onClickListener: ((View, Int) -> Unit)? = null
    private var onCallbackListener: ((Int, Boolean,String) -> Unit)? = null
    private var onPositionCallbackListener: ((Int) -> Unit)? = null
    var type=0

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CustomViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        var view = inflater.inflate(layout, parent, false)

        return when(layout){
            R.layout.item_list_company-> {
                when(viewType){
                    0 -> CompanyNameCardViewHolder(view, onClickListener,onPositionCallbackListener)
                    1 ->{
                        view = inflater.inflate(R.layout.item_list_company2, parent, false)
                        CompanyNameCardViewHolder2(view, onClickListener,onPositionCallbackListener)
                    }
                    2 -> {
                        view = inflater.inflate(R.layout.item_list_company3, parent, false)
                        CompanyNameCardViewHolder3(view, onClickListener,onPositionCallbackListener)
                    }
                    else -> CompanyNameCardViewHolder(view, onClickListener,onPositionCallbackListener)
                }
            }
            else -> CompanyNameCardViewHolder(view, onClickListener,onPositionCallbackListener)
        }
    }

    override fun getItemCount(): Int {
        return items.size
    }

    override fun onBindViewHolder(@NonNull holderCustom: CustomViewHolder, position: Int) {

        holderCustom.init(items[position])

    }

    override fun onBindViewHolder(holder: CustomViewHolder, position: Int, payloads: MutableList<Any>) {
        super.onBindViewHolder(holder, position, payloads)
        if (payloads.isEmpty()) {
            super.onBindViewHolder(holder, position, payloads)
        }else{
            holder.init(items[position])
        }

    }

    override fun getItemViewType(position: Int): Int {
        return type
    }

    fun onListClickListener (onClickListener: (view:View, position:Int) -> Unit){
        this.onClickListener = onClickListener
        notifyDataSetChanged()
    }

    fun onCallbackListener (onCallbackListener: ( position:Int,check:Boolean,name:String) -> Unit){
        this.onCallbackListener = onCallbackListener
        notifyDataSetChanged()
    }

    fun onPositionCallbackListener (onCardViewCallbackListener: (position:Int) -> Unit){
        this.onPositionCallbackListener = onCardViewCallbackListener
        notifyDataSetChanged()
    }

    fun setItems(items: ArrayList<out Any>,type:Int) {
        this.type=type
        this.items = items
        notifyDataSetChanged()
    }

}