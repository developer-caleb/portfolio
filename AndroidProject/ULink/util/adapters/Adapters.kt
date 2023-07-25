package com.bsni.nameq.v2.util.adapters

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.annotation.NonNull
import androidx.recyclerview.widget.RecyclerView
import com.bsni.nameq.R
import com.bsni.nameq.models.database.MyMenu
import com.bsni.nameq.v2.dialog.viewholder.DialogShareViewHolder
import com.bsni.nameq.v2.holder.*
import com.bsni.nameq.v3.mypage.DialogImagechangeViewHolder
import com.bsni.nameq.v3.task.AttachFileViewHolder



class Adapters(var layout: Int,private var items: ArrayList<out Any>) : RecyclerView.Adapter<CustomViewHolder>()  {
    var TAG = "Adapters"
    //private var onitemdraglistener : ItemDragListener
    private var onClickListener: ((View, Int) -> Unit)? = null
    private var onLongClickListener: ((View, Int) -> Unit)? = null
    private var onCallbackListener: ((Int, Boolean,String) -> Unit)? = null
    private var onCallbackTypeListener: ((Int, ADAPTERTYPE, String) -> Unit)? = null
    private var onPositionCallbackListener: ((Int) -> Unit)? = null



    enum class ADAPTERTYPE{EDIT,DEL,MEMBERADD, DETAIL}
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CustomViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        var view = inflater.inflate(layout, parent, false)

        return when(layout){
            R.layout.item_name_card2->  NameCardViewHolder(view, onClickListener,onPositionCallbackListener, onLongClickListener)
            R.layout.item_report2->  ReportViewHolder(view, parent.context,  onClickListener,onPositionCallbackListener)
            R.layout.item_group->  {
                if (viewType <= 4){
                    GroupViewHolder(view, onClickListener)
                }else{
                    view = inflater.inflate(R.layout.item_group_editing, parent, false)
                    GroupViewEditingHolder(view, onClickListener,onCallbackListener)
                }
            }
            R.layout.item_company_group-> {GroupCompanyViewEditingHolder(view, onClickListener,onCallbackTypeListener)}
            R.layout.item_dialog_share->DialogShareViewHolder(view,onClickListener,onPositionCallbackListener)
            R.layout.item_dialog_newdialog->DialogImagechangeViewHolder(view,onClickListener,onPositionCallbackListener)
             //R.layout.item_report_attached -> AttachFileViewHolder(view,onClickListener,onCallbackTypeListener)
            R.layout.item_customer_select-> CustomerSelectViewHolder(view,onClickListener,onPositionCallbackListener)
            R.layout.item_add_report ->AddReportCustmoerViewHolder(view,onClickListener,onPositionCallbackListener)
            R.layout.item_add_report2 -> AddReportNameViewHolder(view,onClickListener,onPositionCallbackListener)
            R.layout.item_add_report3 -> AttachFileViewHolder(view,onClickListener,onCallbackTypeListener)
            R.layout.item_name_card_select -> NameCardSelectViewHolder(view,onClickListener,onPositionCallbackListener)
            R.layout.item_name -> ReportNameViewHolder(view,onClickListener,onPositionCallbackListener)
            R.layout.item_checkable_setting_favorite -> FavoriteListViewHolder(view,onClickListener,onPositionCallbackListener)
           R.layout.item_icon -> FavoriteIconViewHolder(view, onClickListener,onPositionCallbackListener)

            else -> NameCardViewHolder(view, onClickListener,onPositionCallbackListener, onLongClickListener)
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
        return position
    }



    fun onListClickListener (onClickListener: (view:View, position:Int) -> Unit){
        this.onClickListener = onClickListener
        notifyDataSetChanged()
    }
    fun onListLongClickListener (onLongClickListener: (view:View, position:Int) -> Unit){
        this.onLongClickListener = onLongClickListener
        notifyDataSetChanged()
    }

    fun onCallbackListener (onCallbackListener: ( position:Int,check:Boolean,name:String) -> Unit){
        this.onCallbackListener = onCallbackListener
        notifyDataSetChanged()
    }

    fun onCallbackTypeListener (onCallbackListener: ( position:Int,type:ADAPTERTYPE,name:String) -> Unit){
        this.onCallbackTypeListener = onCallbackListener
        notifyDataSetChanged()
    }

    fun onPositionCallbackListener (onCardViewCallbackListener: (position:Int) -> Unit){
        this.onPositionCallbackListener = onCardViewCallbackListener
        notifyDataSetChanged()
    }

    fun setItems(items: ArrayList<out Any>) {
        this.items = items
        notifyDataSetChanged()
    }
    fun setItemWithPosition(item : Nothing , position: Int)
    {
        this.items.set(position, item)
        notifyDataSetChanged()
    }
    fun setItems1(check:Boolean) {
        notifyItemRangeChanged(0,items.size,check)
    }
    fun removeItem(position: Int){
        this.items.removeAt(position)
        notifyDataSetChanged()
    }
    fun addItem(item : Any ){
        this.items.add(item as Nothing)
    }
    fun getcheckquantity() : Int
    {
        var  number = 0
        for(i in 0 until items.size)
        { if ( (items[i] as MyMenu).check) {number++} }
        return number
    }

}
