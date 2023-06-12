package com.example.a1mv20cs077_changewallpaper;

import androidx.appcompat.app.AppCompatActivity;

import android.app.WallpaperManager;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.InputStream;
import java.util.Random;

public class MainActivity extends AppCompatActivity {

    Button btn_change;
    String[] fileNames;
    Handler handler =new Handler();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        BindUiElements();
        btn_change.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try{
                    handler.postDelayed(SelectedImage,1000);
                }
                catch(Exception e)
                {
                    Toast.makeText(MainActivity.this,"Exception Caught"+e.getMessage(),Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private void BindUiElements() {
        btn_change=(Button)findViewById(R.id.btn_change);
    }

    private Runnable SelectedImage=new Runnable() {
        @Override
        public void run() {
            try{
                AssetManager am=getAssets();
                fileNames=am.list("wallpaper");
                int randomNum=new Random().nextInt(fileNames.length);
                WallpaperManager wm=WallpaperManager.getInstance(getApplicationContext());

                InputStream iStream=am.open("wallpaper/"+fileNames[randomNum]);
                Bitmap bitmap= BitmapFactory.decodeStream(iStream);

                wm.setBitmap(bitmap);
                handler.postDelayed(this,5000);
            }
            catch(Exception e)
            {
                Toast.makeText(MainActivity.this,"Exception is:"+e.getMessage().toString(),Toast.LENGTH_SHORT).show();
            }
        }
    };
}