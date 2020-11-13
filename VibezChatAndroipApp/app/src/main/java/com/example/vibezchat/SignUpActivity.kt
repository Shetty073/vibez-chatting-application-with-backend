package com.example.vibezchat

import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.vibezchat.databinding.ActivitySignUpBinding
import com.example.vibezchat.models.UserSignUpModel
import com.example.vibezchat.signuphelper.SignUpHelper

class SignUpActivity : AppCompatActivity() {

    private lateinit var name: String
    private lateinit var email: String
    private lateinit var phone: String
    private lateinit var passwordOne: String
    private lateinit var passwordTwo: String

    private lateinit var userSignUpModel: UserSignUpModel

    private lateinit var binding: ActivitySignUpBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("onCreate", "onCreate() Called")

        // Setup the View Binding for this activity
        binding = ActivitySignUpBinding.inflate(layoutInflater)
        val view: View = binding.root
        setContentView(view)

        // We can now directly access Views without explicitly calling findViewById()
        binding.btnSignUp.setOnClickListener {
            binding.progressBarSignUp.visibility = View.VISIBLE
            getDataFromFields()
            validateFormData()
        }

    }

    private fun getDataFromFields() {
        name = binding.etName.text.toString().trim()
        email = binding.etEmail.text.toString().trim()
        phone = binding.etPhone.text.toString().trim()
        passwordOne = binding.etPasswordOne.text.toString().trim()
        passwordTwo = binding.etPasswordTwo.text.toString().trim()
    }


    private fun validateFormData() {
        if (name.length < 3) {
            Toast.makeText(this, "Name should be at least 3 characters long", Toast.LENGTH_SHORT).show()
        } else if (email.length < 6) {
            Toast.makeText(this, "Email should be at least 6 characters long", Toast.LENGTH_SHORT).show()
        } else if (phone.length < 6) {
            Toast.makeText(this, "Phone no. should be at least 6 characters long", Toast.LENGTH_SHORT).show()
        } else if (passwordOne.length < 6) {
            Toast.makeText(this, "Password should be at least 6 characters long", Toast.LENGTH_SHORT).show()
        } else if (passwordTwo.length < 6) {
            Toast.makeText(this, "Password should be at least 6 characters long", Toast.LENGTH_SHORT).show()
        } else if (passwordOne != passwordTwo) {
            Toast.makeText(this, "Passwords do not match", Toast.LENGTH_SHORT).show()
        } else {
            // Create the userSignUpModel object
            userSignUpModel = UserSignUpModel(name, email, phone, passwordOne)

            // Make the signup request
            SignUpHelper.userSignUpModel = userSignUpModel
            SignUpHelper.signUp()
            binding.progressBarSignUp.visibility = View.INVISIBLE
        }
    }
}
