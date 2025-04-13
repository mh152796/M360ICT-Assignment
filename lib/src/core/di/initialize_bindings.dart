import 'package:get/get.dart';
import 'package:m_360_assignment/src/feature/auth/controller/auth_controller.dart';


Future<void> initializeAppBindings() async {
 Get.lazyPut(() => AuthController());
 Get.find<AuthController>();
}