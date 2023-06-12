package com.example.txttospeech;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.speech.tts.TextToSpeech;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.util.Locale;

public class MainActivity extends AppCompatActivity {
    EditText input;
    Button convert;
    Handler handler=new Handler();
    TextToSpeech t1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        bindUIElements();
        input.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                handler.postDelayed(conversion,0);
                String s=input.getText().toString();
                Toast.makeText(MainActivity.this,s,Toast.LENGTH_SHORT).show();
                t1.speak(s,TextToSpeech.QUEUE_FLUSH,null,null);

            }
        });
    }
    private Runnable conversion=new Runnable() {
        @Override
        public void run() {
             t1 = new TextToSpeech(getApplicationContext(), new TextToSpeech.OnInitListener() {
                @Override
                public void onInit(int status) {
                    if(status!=TextToSpeech.ERROR)
                    {
                        t1.setLanguage(Locale.UK);
                    }
                }
            });
        }
    };
    private void bindUIElements() {
        input=(EditText) findViewById(R.id.input);
        convert=(Button)findViewById(R.id.btn_convert);
    }
}