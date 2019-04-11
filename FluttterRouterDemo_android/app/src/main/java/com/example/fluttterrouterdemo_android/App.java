package com.example.fluttterrouterdemo_android;

import android.app.Application;
import android.content.Intent;

import com.xcw.hybrid_manager.WCXFlutterResponse;
import com.xcw.hybrid_manager.WCXURLRouter;
import com.xcw.hybrid_manager.WCXURLRouterHandler;

import java.util.HashMap;
import java.util.Map;

public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        WCXURLRouter.setAppContext(getApplicationContext(), new WCXURLRouterHandler() {
            @Override
            public void flutterOpenNativeWithURL(String url, HashMap params) {
                Intent intent = new Intent(App.this, MainActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }

            @Override
            public void sendRequestWithURL(String url, String command, Map params, WCXFlutterResponse response) {
                response.onSuccess("service resonse json");
            }
        });
    }
}
