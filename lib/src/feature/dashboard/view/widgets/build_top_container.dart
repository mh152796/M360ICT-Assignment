import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/core_export.dart';


class BuildTopContainer extends StatelessWidget {
  const BuildTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
     return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: CustomPaint(
        painter: HeaderPainter(),
        child: SizedBox(
          height: ResponsiveHelper.isMobile(context)? 180 : 190,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Left side text
              Expanded(
                flex: 11,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Good Morning',
                        style: GoogleFonts.poppins(
                          fontSize: ResponsiveHelper.isMobile(context)? 16 : 18,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(131, 131, 131, 1),
                        ),
                      ),
                      Text(
                        authController.currentUser.value?.displayName ?? 'Ahmed Ariyan',
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(30, 30, 30, 1),
                          fontSize: ResponsiveHelper.isMobile(context)? 18 : 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(20),
                      Text.rich(
                        TextSpan(
                          text: 'You are in a ',
                          style: GoogleFonts.poppins(
                            fontSize: ResponsiveHelper.isMobile(context)? 14 : 16,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(131, 131, 131, 1),
                          ),
                          children: [
                            TextSpan(
                              text: 'healthy',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(71, 186, 128, 1),
                              ),
                            ),
                            TextSpan(text: ' environment'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: EdgeInsets.only(left: Get.width * .10),
                  child: Center(
                    child: CircleAvatar(
                      radius: ResponsiveHelper.isMobile(context)? 50 : 52,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                       child: CachedNetworkImage(
                         errorWidget: (___, __, _) => Icon(Icons.person, color: Colors.white,),
                           fit: BoxFit.fill,
                           imageUrl: Get.find<AuthController>().currentUser.value?.photoURL ?? ""),
                                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Color.fromRGBO(230, 245, 237, 1);
    final paint2 =
    Paint()..color = Color.fromRGBO(211, 248, 229, 1); // light green

    // Draw white background first
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint1);

    // Draw green diagonal area
    final path =
    Path()
      ..moveTo(size.width * 0.55, 0) // top starting point
      ..lineTo(size.width, 0) // top-right corner
      ..lineTo(size.width, size.height) // bottom-right corner
      ..lineTo(
        size.width * .70,
        size.height,
      ) // bottom-left of the green section
      ..close();

    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
