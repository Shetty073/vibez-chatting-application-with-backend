package com.example.vibezchat;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class SignUpActivity extends AppCompatActivity {

    Button btnSignUp;
    EditText etName, etEmail, etPhone, etPasswordOne, etPasswordTwo;
    String name, email, phone, passwordOne, passwordTwo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Remove the actionbar
        if(getSupportActionBar() != null) getSupportActionBar().hide();

        setContentView(R.layout.activity_sign_up);

        // TODO: Consider using Android Jetpack DataBinding instead of repeatedly calling findViewById()
        etName = findViewById(R.id.etName);
        etEmail = findViewById(R.id.etEmail);
        etPhone = findViewById(R.id.etPhone);
        etPasswordOne = findViewById(R.id.etPasswordOne);
        etPasswordTwo = findViewById(R.id.etPasswordTwo);
        btnSignUp = findViewById(R.id.btnSignUp);

    }
}