import 'dart:typed_data';

import 'package:pigeon/pigeon_lib.dart';

class ProtoWrapper {
  Uint8List proto;
}

@HostApi(dartHostTestHandler: 'TestHostFitApi')
abstract class FitApi {
  void initialize();

  void dispose();

  ProtoWrapper getActivityType(ProtoWrapper request);

  ProtoWrapper listActivityLogs(ProtoWrapper request);
}

void configurePigeon(PigeonOptions opts) {
  opts.dartOut = 'lib/messages.dart';
  opts.objcHeaderOut = 'ios/Classes/messages.h';
  opts.objcSourceOut = 'ios/Classes/messages.m';
  opts.objcOptions.prefix = 'FLT';
  opts.javaOut =
      'android/src/main/java/kr/dietfriends/plugins/fit/Messages.java';
  opts.javaOptions.package = 'kr.dietfriends.plugins.fit';
}
