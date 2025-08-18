import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/core/dependencies/getx_dependencies.dart';
import 'package:with_prana_mobile_app/core/route/routes.dart';
import 'package:with_prana_mobile_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetxDependencies();
  runApp(MyApp());
}

class MyApp extends HookWidget {
  MyApp({super.key});

  final commonController = Get.find<CommonController>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //// Listen to app lifecycle changes for audio management
    final appLifecycleState = useState(AppLifecycleState.resumed);

    //// Handle lifecycle changes
    useEffect(() {
      // Hook into app lifecycle changes
      WidgetsBinding.instance.addObserver(
        LifecycleObserver(
          onPaused: () {
            commonController.backGroundAudioPlayer.pause();
            appLifecycleState.value = AppLifecycleState.paused;
          },
          onResumed: () {
            commonController.backGroundAudioPlayer.resume();
            appLifecycleState.value = AppLifecycleState.resumed;
          },
        ),
      );

      return () {
        commonController.backGroundAudioPlayer.stop();
        commonController.backGroundAudioPlayer.dispose();
      };
    }, []);

    return SafeArea(
      top: false,
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'With Prana',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            fontFamily: 'Poppins',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: (settings) => getRoute(settings, context),
          builder:
              (context, child) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.noScaling),
                child: FlutterSmartDialog.init()(context, child),
              ),
        ),
      ),
    );
  }
}

class LifecycleObserver extends WidgetsBindingObserver {
  final VoidCallback onPaused;
  final VoidCallback onResumed;

  LifecycleObserver({required this.onPaused, required this.onResumed});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      onPaused();
    } else if (state == AppLifecycleState.resumed) {
      onResumed();
    }
  }
}
