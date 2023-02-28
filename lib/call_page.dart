import 'package:flutter/material.dart';
import 'package:video_call/constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Callpage extends StatelessWidget {
  const Callpage({
    super.key,
    required this.callID,
    required this.userName,
    required this.userId,
  });

  final String callID;
  final String userName;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: MyConst.appId,
      appSign: MyConst.appSign,
      userID: userId,
      userName: userName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.pop(context),
    );
  }
}
