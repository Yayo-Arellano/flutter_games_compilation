import 'package:flutter/foundation.dart';

bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

bool get isWeb => kIsWeb;

bool get isMobile => isIOS && isAndroid;
