import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class SnackBarService{

  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelfunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 100 : 75,
            padding: EdgeInsets.only(right: 8),
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Row(
                 children: [
                Container(
                  height: double.infinity,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green, // Fixed color value
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Lottie.asset(
                    "assets/icons/success.json",
                    repeat: false,
                    height: 250,
                    width: 250,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Success",
                          textAlign: TextAlign.start,
                          maxLines: 3)
                    ],
                  ),
                )
              ],
            )
                : null,
          ),
        );
      },
      duration: Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelfunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 100 : 75,
            padding: EdgeInsets.only(right: 8),
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red, // Fixed color value
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Lottie.asset(
                    "assets/icons/error.json", // Replace with a valid path
                    repeat: false,
                    height: 250, // Adjusted height
                    width: 250, // Adjusted width
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Error",
                          textAlign: TextAlign.start,
                          maxLines: 3)
                    ],
                  ),
                )
              ],
            )
                : null,
          ),
        );
      },
      duration: Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}