package net.avivavoz.bts.justthelyrics

import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.RatingBar
import android.widget.TextView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin.NativeAdFactory
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "net.avivavoz.bts.justthelyrics/updateColor";
    var methodChannelResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(GoogleMobileAdsPlugin())
        super.configureFlutterEngine(flutterEngine)
        val nativeAdFactory = NativeAdFactoryLyricsAI(layoutInflater)
     
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            methodChannelResult = result;
            when (call.method) {
                "updateAdColor" -> {
                    val colorHex = call.argument<String>("colorHex")
                    val color = Color.parseColor(colorHex)
                    nativeAdFactory.updateAdColor(color)
                    result.success(colorHex)
                }
            };
        }
         
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "nativeAdFactory",
            NativeAdFactoryLyricsAI(layoutInflater)
        )
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "nativeAdFactory")
    }
}

class NativeAdFactoryLyricsAI : NativeAdFactory {
    private var layoutInflater: LayoutInflater
    constructor(layoutInflater: LayoutInflater) {
        this.layoutInflater = layoutInflater
    }

    fun updateAdColor(color: Int) {
        val adView = layoutInflater.inflate(R.layout.native_ad_ai, null) as NativeAdView
        adView.callToActionView = adView.findViewById(R.id.ad_call_to_action)
        (adView.callToActionView as Button).setBackgroundColor(color)
    }

    override fun createNativeAd(
        nativeAd: NativeAd?,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.native_ad_ai, null) as NativeAdView
        adView.setBackgroundColor(Color.parseColor("#000000"))

        if (customOptions!!["darkMode"] == true) {
           adView.setBackgroundResource(R.drawable.border)
           // adView.setBackgroundColor(Color.parseColor("#000000"))
        } else {
            adView.setBackgroundResource(R.drawable.border_light)
         //   adView.setBackgroundColor(Color.parseColor("#456764"))

        }

        adView.headlineView = adView.findViewById(R.id.ad_headline)
        adView.bodyView = adView.findViewById(R.id.ad_body)
        adView.callToActionView = adView.findViewById(R.id.ad_call_to_action)
        adView.iconView = adView.findViewById(R.id.ad_app_icon)
        adView.priceView = adView.findViewById(R.id.ad_price)
        adView.starRatingView = adView.findViewById(R.id.ad_stars)
        adView.storeView = adView.findViewById(R.id.ad_store)
        adView.advertiserView = adView.findViewById(R.id.ad_advertiser)

        // The headline and mediaContent are guaranteed to be in every NativeAd.
         if (customOptions!!["darkMode"] == true) {
            (adView.headlineView as TextView).setTextColor(Color.parseColor("#ffffff"))
        } else {
            (adView.headlineView as TextView).setTextColor(Color.parseColor("#000000"))
        } 
        (adView.headlineView as TextView).text = nativeAd?.headline


        (adView.headlineView as TextView).text = nativeAd?.headline
        //    adView.mediaView?.mediaContent = nativeAd?.mediaContent
        // These assets aren't guaranteed to be in every NativeAd, so it's important to
        // check before trying to display them.

        if (nativeAd?.body == null) {
            adView.bodyView?.visibility = View.INVISIBLE
        } else {
             adView.bodyView?.visibility = View.VISIBLE
            if (customOptions!!["darkMode"] == true) {
                (adView.bodyView as TextView).setTextColor(Color.parseColor("#ffffff"))
            } else {
                (adView.bodyView as TextView).setTextColor(Color.parseColor("#000000"))
            } 
            (adView.bodyView as TextView).text = nativeAd.body
        }
 
        if (nativeAd?.callToAction == null) {
            adView.callToActionView?.visibility = View.INVISIBLE
        } else {
             adView.callToActionView?.visibility = View.VISIBLE
            if (customOptions!!["darkMode"] == true) {
                (adView.callToActionView as Button).setBackgroundColor(Color.parseColor("#F79327"))
            } else {
                (adView.callToActionView as Button).setBackgroundColor(Color.parseColor("#F79327"))
            } 
            (adView.callToActionView as Button).text = nativeAd.callToAction
        }

        if (nativeAd?.icon == null) {
            adView.iconView?.visibility = View.GONE
        } else {
            (adView.iconView as ImageView).setImageDrawable(nativeAd.icon!!.drawable)
            adView.iconView?.visibility = View.VISIBLE
        }

         if (nativeAd?.price == null) {
             adView.priceView?.visibility = View.INVISIBLE
         } else {
             adView.priceView?.visibility = View.VISIBLE
             if (customOptions!!["darkMode"] == true) {
                 (adView.priceView as TextView).setTextColor(Color.parseColor("#ffffff"))
             } else {
                 (adView.priceView as TextView).setTextColor(Color.parseColor("#000000"))
             }
             (adView.priceView as TextView).text = nativeAd.price
         } 

        if (nativeAd?.store == null) {
            adView.storeView?.visibility = View.INVISIBLE
        } else {
             adView.storeView?.visibility = View.VISIBLE
            if (customOptions!!["darkMode"] == true) {
                (adView.storeView as TextView).setTextColor(Color.parseColor("#ffffff"))
            } else {
                (adView.storeView as TextView).setTextColor(Color.parseColor("#000000"))
            } 
            (adView.storeView as TextView).text = nativeAd.store
        }

        if (nativeAd?.starRating == null) {
            adView.starRatingView?.visibility = View.INVISIBLE
        } else {
            (adView.starRatingView as RatingBar).rating = nativeAd.starRating!!.toFloat()
            adView.starRatingView?.visibility = View.VISIBLE
        }

        if (nativeAd?.advertiser == null) {
            adView.advertiserView?.visibility = View.INVISIBLE
        } else {
             adView.advertiserView?.visibility = View.VISIBLE
            if (customOptions!!["darkMode"] == true) {
                (adView.advertiserView as TextView).setTextColor(Color.parseColor("#ffffff"))
            } else {
                (adView.advertiserView as TextView).setTextColor(Color.parseColor("#000000"))
            }
            (adView.advertiserView as TextView).text = nativeAd.advertiser
        }

        // This method tells the Google Mobile Ads SDK that you have finished populating your
        // native ad view with this native ad.
        if (nativeAd != null) {
            adView.setNativeAd(nativeAd)
        }

        return adView
    }

}

