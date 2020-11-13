package com.example.vibezchat.signuphelper

import com.example.vibezchat.models.UserSignUpModel


class SignUpHelper {

    companion object {
        lateinit var userSignUpModel: UserSignUpModel
        var jwt: String? = null

        fun signUp(): Unit {
            sendPost()
        }

        private fun sendPost(): Unit {
            // TODO: Complete this using retrofit and gson
        }

    }
}
