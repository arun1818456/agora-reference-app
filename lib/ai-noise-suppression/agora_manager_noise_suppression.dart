import 'package:agora_rtc_engine/agora_rtc_engine.dart';

import '../agora-manager/agora_manager.dart';
import '../authentication-workflow/agora_manager_authentication.dart';

class AgoraManagerNoiseSuppression extends AgoraManagerAuthentication {
  AgoraManagerNoiseSuppression({
    required ProductName currentProduct,
    required Function(String message) messageCallback,
    required Function(String eventName, Map<String, dynamic> eventArgs)
    eventCallback,
  }) : super(
    currentProduct: currentProduct,
    messageCallback: messageCallback,
    eventCallback: eventCallback,
  ) {
    // Additional initialization specific to AgoraManagerNoiseSuppression
  }

  static Future<AgoraManagerNoiseSuppression> create({
    required ProductName currentProduct,
    required Function(String message) messageCallback,
    required Function(String eventName, Map<String, dynamic> eventArgs)
    eventCallback,
  }) async {
    final manager = AgoraManagerNoiseSuppression(
      currentProduct: currentProduct,
      messageCallback: messageCallback,
      eventCallback: eventCallback,
    );

    await manager.initialize();
    return manager;
  }

  @override
  Future<void> setupAgoraEngine() async {
    super.setupAgoraEngine();

    agoraEngine?.setAINSMode(
        enabled: true,
        mode: AudioAinsMode.ainsModeBalanced
    );
  }
}