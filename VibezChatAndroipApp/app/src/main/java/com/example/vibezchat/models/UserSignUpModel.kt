package com.example.vibezchat.models

import com.google.gson.annotations.SerializedName

data class UserSignUpModel(
        @SerializedName("name")
        val name: String,
        @SerializedName("email")
        val email: String,
        @SerializedName("phone")
        val phone: String,
        @SerializedName("password")
        val password: String,
)
