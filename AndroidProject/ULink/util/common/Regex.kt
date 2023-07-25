package com.bsni.nameq.v2.util.common

    //================================정규표현식==========================================
    fun isEmail(email: String): Boolean {
        val pattern = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$".toRegex()
        return !email.matches(pattern)
    }


