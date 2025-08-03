import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionDetailsController extends GetxController {
  final currentAppVersion = "".obs;

  Future<void> getCurrentAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    currentAppVersion(packageInfo.version);
  }
}
