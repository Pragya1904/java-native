package com.example.a1mv20cs077_counter;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    TextView result;
    Button bStart,bStop;
    Handler handler=new Handler();
    int count=0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        BindUIEelements();
        bStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try{
                    handler.postDelayed(updateTime,0);
                }
                catch (Exception e)
                {
                    Toast.makeText(MainActivity.this,"Exception: "+e.getMessage(),Toast.LENGTH_SHORT).show();
                }
            }
        });
        bStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try{
                    handler.removeCallbacks(updateTime);
                }
                catch (Exception e)
                {
                    Toast.makeText(MainActivity.this,"Exception: "+e.getMessage(),Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private Runnable updateTime=new Runnable() {
        @Override
        public void run() {
            try{

                result.setText(""+count);
                count++;
                handler.postDelayed(this,1000);
            }
            catch (Exception e)
            {
                Toast.makeText(MainActivity.this,"Exception: "+e.getMessage(),Toast.LENGTH_SHORT).show();
            }
        }
    };
    private void BindUIEelements() {
        result=(TextView) findViewById(R.id.result);
        bStart=(Button)findViewById(R.id.start_btn);
        bStop=(Button)findViewById(R.id.stop_btn);
    }
}