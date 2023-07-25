package com.bsni.nameq.v2.util.adapters.viewpager

import android.util.Log
import androidx.recyclerview.widget.ItemTouchHelper
import androidx.recyclerview.widget.RecyclerView

class ItemMoveCallback(private val mAdapter: ItemTouchHelperContract) : ItemTouchHelper.Callback() {
    var TAG= "ItemMoveCallback"
    override fun isLongPressDragEnabled(): Boolean {
       // Log.d(TAG, "isLongPressDragEnabled: ")
        return false
    }

    override fun isItemViewSwipeEnabled(): Boolean {
        //Log.d(TAG, "isItemViewSwipeEnabled: ")
        return false
    }

    override fun onSwiped(viewHolder: RecyclerView.ViewHolder, i: Int) {
        //og.d(TAG, "onSwiped: ")
    }

    override fun getMovementFlags(recyclerView: RecyclerView, viewHolder: RecyclerView.ViewHolder): Int {
        val dragFlags = ItemTouchHelper.UP or ItemTouchHelper.DOWN or  ItemTouchHelper.LEFT or ItemTouchHelper.RIGHT
        //Log.d(TAG, "getMovementFlags: ")
                return makeMovementFlags(dragFlags, 0)
    }

    override fun onMove(recyclerView: RecyclerView, target: RecyclerView.ViewHolder, viewHolder: RecyclerView.ViewHolder): Boolean {
        mAdapter.onRowMoved(viewHolder.adapterPosition, target.adapterPosition)
        //Log.d(TAG, "onMove: ")
        return true
    }

    override fun onSelectedChanged(viewHolder: RecyclerView.ViewHolder?, actionState: Int) {
        if (actionState != ItemTouchHelper.ACTION_STATE_IDLE) {
            if (viewHolder is DragableReclerViewAdapter.MyViewHolder) {
                mAdapter.onRowSelected(viewHolder)
            }
        }
        //Log.d(TAG, "onSelectedChanged: ")
        super.onSelectedChanged(viewHolder, actionState)
    }

    override fun clearView(recyclerView: RecyclerView, viewHolder: RecyclerView.ViewHolder) {
        super.clearView(recyclerView, viewHolder)
        //Log.d(TAG, "clearView: ")
        if (viewHolder is DragableReclerViewAdapter.MyViewHolder) {
            mAdapter.onRowClear(viewHolder)
        }
    }

    interface ItemTouchHelperContract {
        fun onRowMoved(fromPosition: Int, toPosition: Int)
        fun onRowSelected(myViewHolder: DragableReclerViewAdapter.MyViewHolder)
        fun onRowClear(myViewHolder: DragableReclerViewAdapter.MyViewHolder)
    }
}