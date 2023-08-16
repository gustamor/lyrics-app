import 'dart:async';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/global.dart';

class Dialogs {
  static Future<bool> confirm(BuildContext context,
      {String? title,
      String? body,
      String? confirmText,
      String? cancelText}) async {
    final Completer<bool> c = Completer();
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            alignment: Alignment.bottomCenter,
            child: CupertinoActionSheet(
              title: title != null
                  ? Text(
                      title,
                      style: 
                      GoogleFonts.poiretOne(
                        textStyle:  const TextStyle(fontSize: 17),
                      )
                     
                    )
                  : null,
              message: body != null ? Text(
                      body,
                       style: 
                      GoogleFonts.poiretOne(
                        textStyle:  const TextStyle(fontSize: 18,fontWeight:FontWeight.w600),
                      )
                    ) : null,
              actions: <Widget>[
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      c.complete(true);
                    },
                    child: Text(
                      confirmText ?? kOk,
                     style: 
                      GoogleFonts.poiretOne(
                        textStyle:  const TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      )
                    )),
              ],
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                    c.complete(false);
                  },
                  child: Text(
                    cancelText ?? kCancel,
                  style: 
                      GoogleFonts.poiretOne(
                        textStyle:  const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                      )
                  )),
            ),
          );
        });

    return c.future;
  }
  static Future<bool> exit(BuildContext context,
      {String? title,
      String? confirmText,
      String? rateText,
      String? cancelText}) async {
    final Completer<bool> c = Completer();

    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.bottomCenter,
            child: CupertinoActionSheet(
              title: title != null
                  ? Text(
                      title,
                      style: TextStyle(
                       // color: Colors.white,
                         fontSize: 20),
                    )
                  : null,
              actions: <Widget>[
                CupertinoActionSheetAction(
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                      // Navigator.pop(context);
                      c.complete(true);
                    },
                    child: Text(
                      confirmText ?? kOk,
                      style: TextStyle(
                        //  color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    )),
                CupertinoActionSheetAction(
                    onPressed: () async {
                      try {
                        AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: kGPAppLink,
                        );
                        await intent.launch();
                      } catch (e) {}
                      Navigator.pop(context);
                      c.complete(true);
                    },
                    child: Text(
                      rateText ?? kRateUsMessage,
                      style: TextStyle(
                        //  color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
              ],
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                    c.complete(false);
                  },
                  child: Text(
                    cancelText ?? kCancel,
                    style: TextStyle(
                     //   color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.w300),
                  )),
            ),
          );
        });

    return c.future;
  } 
}


 