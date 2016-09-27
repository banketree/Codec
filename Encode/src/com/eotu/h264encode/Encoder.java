package com.eotu.h264encode;

import android.content.res.Configuration;
import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.util.Log;
import android.util.Size;

import java.io.IOException;
import java.nio.ByteBuffer;

/**
 * Created by banketree on 8/2/2016.
 */
public class Encoder {
	private static final String TAG = Encoder.class.getSimpleName();

	public static final String VCODEC = "video/avc";
	public static final String ACODEC = "audio/mp4a-latm";

	public static String Video_x264Preset = "superfast";
	public static String Video_HD_x264Preset = "veryfast";

	public static int Video_Bitrate = 500 * 1000; // 500kbps
	public static int Video_HD_Bitrate = 1200 * 1000; // 1200 kbps
	public static final int Video_VFPS = 24;
	public static final int Video_VGOP = 48;
	public static final int Video_ASAMPLERATE = 44100;
	public static final int Video_ACHANNEL = AudioFormat.CHANNEL_IN_STEREO;
	public static final int Video_ABITRATE = 32 * 1000; // 32kbps

	// 视频参数
	private Size mInVideoSize = new Size(1280, 720);
	private Size mOutVideoSize = new Size(1280, 720);

	private int mBitrate = Video_Bitrate; //
	private int mFps = Video_VFPS;
	private int mGop = Video_VGOP;

	private String mX264Preset = Video_x264Preset;

	private int mOrientation = Configuration.ORIENTATION_PORTRAIT;

	public void setVideoHDMode() {
		mBitrate = Video_HD_Bitrate; //
		mX264Preset = "veryfast";
	}

	public void setVideoSmoothMode() {
		mBitrate = Video_Bitrate; // 500 kbps
		mX264Preset = Video_x264Preset;
	}

	public Size getInSize() {
		return mInVideoSize;
	}

	public Size getOutSize() {
		return mOutVideoSize;
	}
	
	

	// 软解码与硬解码
	private native void setEncoderResolution(int outWidth, int outHeight);

	private native void setEncoderFps(int fps);

	private native void setEncoderGop(int gop);

	private native void setEncoderBitrate(int bitrate);

	private native void setEncoderPreset(String preset);

	private native byte[] NV21ToI420(byte[] yuvFrame, int width, int height,
			boolean flip, int rotate);

	private native byte[] NV21ToNV12(byte[] yuvFrame, int width, int height,
			boolean flip, int rotate);

	private native int NV21SoftEncode(byte[] yuvFrame, int width, int height,
			boolean flip, int rotate, long pts);

	private native boolean openSoftEncoder();

	private native void closeSoftEncoder();

	static {
		System.loadLibrary("enc");
	}
}
