package com.example.app;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
import butterknife.BindView;
import butterknife.ButterKnife;

public class MyActivity extends Activity {

  @BindView(R.id.my_text)
  TextView text;

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.my_layout);
    ButterKnife.bind(this);
    text.setText("Hello world!");
  }
}
