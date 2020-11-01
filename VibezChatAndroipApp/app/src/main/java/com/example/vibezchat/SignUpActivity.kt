package com.example.vibezchat

import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.vibezchat.databinding.ActivitySignUpBinding

class SignUpActivity : AppCompatActivity() {
    private var name: String? = null
    private var email: String? = null
    private var phone: String? = null
    private var passwordOne: String? = null
    private var passwordTwo: String? = null

    private lateinit var binding: ActivitySignUpBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("onCreate", "onCreate() Called")

        // Setup the View Binding for this activity
        binding = ActivitySignUpBinding.inflate(layoutInflater)
        val view: View = binding!!.root
        setContentView(view)

        // We can now directly access Views without explicitly calling findViewById()
        binding.btnSignUp.setOnClickListener {
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
        if (name!!.isEmpty()) {
            Toast.makeText(this, "Name can not be empty", Toast.LENGTH_SHORT).show()
        }
        if (email!!.isEmpty()) {
            Toast.makeText(this, "Email can not be empty", Toast.LENGTH_SHORT).show()
        }
        if (phone!!.isEmpty()) {
            Toast.makeText(this, "Phone no. can not be empty", Toast.LENGTH_SHORT).show()
        }
        if (passwordOne!!.isEmpty()) {
            Toast.makeText(this, "Password can not be empty", Toast.LENGTH_SHORT).show()
        }
        if (passwordTwo!!.isEmpty()) {
            Toast.makeText(this, "Password can not be empty", Toast.LENGTH_SHORT).show()
        }
        if (passwordOne != passwordTwo) {
            Toast.makeText(this, "Passwords do not match", Toast.LENGTH_SHORT).show()
        }
    }
}