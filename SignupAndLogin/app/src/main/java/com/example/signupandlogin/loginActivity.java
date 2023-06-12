package com.example.signupandlogin;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class loginActivity extends AppCompatActivity
{
    Button login_btn;
    TextView tv;
    Integer clickCount = 0;
    EditText passlogin,emaillogin;
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        Bundle bundle = getIntent().getExtras();
        String signupUsername = bundle.getString("Username");
        String signupPassword = bundle.getString("Password");

        BindUiElement();
        
        
        tv=(TextView)findViewById(R.id.textView);
        login_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //String spass=passsignup.getText().toString();
             //   String lpass=passlogin.getText().toString();
                String uname = emaillogin.getText().toString();
                String pass = passlogin.getText().toString();
//Check if the User has already tried 2 Attempt to Login
                if(clickCount < 2) {
//Check Username and Password entered by user with Signup Activity Username and Password
                    if(uname.equals(signupUsername) && pass.equals(signupPassword)) {
                        Toast.makeText(loginActivity.this, "Successful Login", Toast.LENGTH_LONG).show();
                    }
                    else {
//Increase click count if Login failed
                        clickCount++;
                            System.out.println(signupPassword);
                        System.out.println(pass);
                        System.out.println(signupUsername);
                        System.out.println(uname);
                        Toast.makeText(loginActivity.this, "Login Failed", Toast.LENGTH_LONG).show();
                    }
                }
                else {
//Login Attempt failed
                    Toast.makeText(loginActivity.this, "Failed Login Attempt", Toast.LENGTH_SHORT).show();
//Disable Login Button , not allowing user to retry after 2 attempt
                    login_btn.setEnabled(false);
                }
            }
        });

    }

    private void BindUiElement() {
        emaillogin = (EditText) findViewById(R.id.Login_email);
        passlogin = (EditText) findViewById(R.id.Login_Password);
        login_btn = (Button) findViewById(R.id.loginbtn);
    }
}