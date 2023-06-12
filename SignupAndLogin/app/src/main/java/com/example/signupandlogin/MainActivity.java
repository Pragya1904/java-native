package com.example.signupandlogin;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import java.util.regex.Pattern;

public class MainActivity extends AppCompatActivity
{ EditText email_Sign, password_Sign;
    Button signUp_btn;
    @Override protected void onCreate(Bundle savedInstanceState)
    { super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        BindUiElements();
        String email = email_Sign.getText().toString();
        String password = password_Sign.getText().toString();
        String specialCharRegex = ".*[@#!$%^&+=].*";
        String upperCaseRegex = ".*[A-Z].*";
        String numberRegex = ".*[0-9].*";
        String lowerCaseRegex = ".*[a-z].*";
        String emailRegex="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$";

        signUp_btn.setOnClickListener(new View.OnClickListener()
        { @Override public void onClick(View v)
        {
            String email = email_Sign.getText().toString();
            String password = password_Sign.getText().toString();
            if(email.length() <= 0 || password.length() <= 0) {
                Toast.makeText(MainActivity.this, "email or Password cannot be empty", Toast.LENGTH_SHORT).show();
            }
            else
            {
                if(!email.matches(emailRegex))
                {
                    Toast.makeText(MainActivity.this, "Invalid email", Toast.LENGTH_SHORT).show();
                }
               else if(!password.matches(specialCharRegex)){
                    Toast.makeText(MainActivity.this, "Password should contain special character", Toast.LENGTH_SHORT).show();
                }
                else if(!password.matches(upperCaseRegex)) {
                    Toast.makeText(MainActivity.this, "Password should contain Uppercase letter", Toast.LENGTH_SHORT).show();
                }
                else if(!password.matches(lowerCaseRegex)) {
                    Toast.makeText(MainActivity.this, "Password should contain Lowercase letter", Toast.LENGTH_SHORT).show();
                }
                else if(!password.matches(numberRegex)) {
                    Toast.makeText(MainActivity.this, "Password should contain Number", Toast.LENGTH_SHORT).show();
                }
                else if(password.length() < 8) {
                    Toast.makeText(MainActivity.this, "Password should contain atleast 8 characters", Toast
                            .LENGTH_SHORT).show();
                }
                else {
                    Bundle bundle = new Bundle();
                    bundle.putString("Username",email);
                    bundle.putString("Password",password);
                    Intent intent = new Intent(MainActivity.this,loginActivity.class);
                    intent.putExtras(bundle);
                    startActivity(intent);
                }
        }} }); }

    private void BindUiElements() {
        email_Sign=(EditText)findViewById(R.id.SignUp_email);
        password_Sign=(EditText)findViewById(R.id.SignUp_Password);
        signUp_btn =(Button)findViewById(R.id.signUpBtn);
    }

    Pattern lowerCase= Pattern.compile("^.*[a-z].*$");
    Pattern upperCase=Pattern.compile("^.*[A-Z].*$");
    Pattern number = Pattern.compile("^.*[0-9].*$");
    Pattern special_Chara = Pattern.compile("^.*[^a-zA-Z0-9].*$");

    private Boolean isValidPassword(String password)
    {
        if(password.length()<8)
            { return false; }
        if(!lowerCase.matcher(password).matches())
            { return false; }
        if(!upperCase.matcher(password).matches())
            { return false; }
        if(!number.matcher(password).matches())
            { return false; }
        if(!special_Chara.matcher(password).matches())
            { return false; }
        return true;
    }
}