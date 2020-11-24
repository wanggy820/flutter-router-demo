package com.example.fluttterrouterdemo_android;

import android.app.Application;
import android.content.Intent;
import android.net.Uri;
import java.util.Map;
import io.flutter.Log;

import com.tojoy.tj_flutter_router_plugin.TJFlutterActivity;
import com.tojoy.tj_flutter_router_plugin.TJHTTPResponse;
import com.tojoy.tj_flutter_router_plugin.TJRouterManager;
import com.tojoy.tj_flutter_router_plugin.TJRouterManagerDelegate;



public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();

        TJRouterManager.delegate = new TJRouterManagerDelegate() {
            @Override
            public void openURL(String url, TJCompletion completion) {
                Uri uri = Uri.parse(url);
                Log.d("MainActivity***", uri.getAuthority());
                Log.d("MainActivity***", uri.getPath());
                if ("flutter".equals(uri.getAuthority())) {
                    Intent intent = new Intent(App.this, TJFlutterActivity.class);
                    intent.putExtra("url", url);
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK );
                    startActivity(intent);

                    //flutter回调
                    TJRouterManager.completeCache.put(url, new TJCompletion() {
                        @Override
                        public void completion(Object result) {
                            Log.d("MainActivity***", "result:"+result);
                        }
                    });
                } else if ("/vc1".equals(uri.getPath())) {
                    Intent intent = new Intent(App.this, Activity1.class);
                    intent.putExtra("url", url);
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK );
                    startActivity(intent);
                    //原生传给flutter的回调
                    completion.completion("lalala");
                } else if ("/vc2".equals(uri.getPath())) {
                    Intent intent = new Intent(App.this, Activity2.class);
                    intent.putExtra("url", url);
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK );
                    startActivity(intent);
                }
            }


            @Override
            public void sendRequestWithURL(String url, Map params, TJHTTPResponse response) {
                response.onSuccess("onSuccess");
            }

        };
    }
}
