package com.eotu.decode;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;

public class Test extends Activity implements OnClickListener {
	private H264Decoder mH264Decoder;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		findViewById(R.id.Button_start).setOnClickListener(this);
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

	@Override
	public void onClick(View v) {
		if (v.getId() == R.id.Button_start) {
			Intent intent = new Intent(this, H264Android.class);
			startActivity(intent);
			// if (mH264Decoder == null)
			// mH264Decoder = new H264Decoder(H264Decoder.COLOR_FORMAT_YUV420);
			//
			// int width = mH264Decoder.getWidth();
			// int height = mH264Decoder.getHeight();

		}
	}

}
