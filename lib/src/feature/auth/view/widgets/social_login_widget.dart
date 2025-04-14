import 'package:m_360_assignment/src/core/core_export.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveHelper.isMobile(context)? 258: 266,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildImage(context, AssetsPath.googleIcon, () {
            Get.find<AuthController>().googleSign();
          },),
          buildImage(context, AssetsPath.facebookIcon, () {

          },),
          buildImage(context, AssetsPath.microsoftIcon, () {

          },),
          buildImage(context, AssetsPath.appleIcon, () {

          },),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context, String imagePath, VoidCallback onTap) {
    final size = ResponsiveHelper.isMobile(context)? 52.0 : 60.0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Color.fromRGBO(71, 186, 128, 0.1),
        padding: EdgeInsets.all(15), // remove padding to fit the shape
        fixedSize: Size(size, size),  // width and height must be the same
        shape: CircleBorder(),    // perfect circle
        elevation: 5,             // optional: control elevation
        backgroundColor: Colors.white, // optional: set background
      ),
      onPressed: onTap,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
