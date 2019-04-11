package com.example.fluttterrouterdemo_android;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import com.xcw.hybrid_manager.WCXURLRouter;
import java.util.HashMap;


public class MainActivity extends Activity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
//    GeneratedPluginRegistrant.registerWith(this);
    setContentView(R.layout.main_activity);

  }


  public void onClick(View v) {
    HashMap params = new HashMap();
    params.put("responseTips", "1111");
    params.put("responseCode", 1);
    WCXURLRouter.openFlutterWithURL("/test", params);
  }
}
