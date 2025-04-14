import 'package:m_360_assignment/src/feature/dashboard/view/widgets/build_top_container.dart';
import 'package:m_360_assignment/src/feature/dashboard/view/widgets/place_card.dart';

import '../../../../core/core_export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFFA),
      body: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTopContainer(),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("My Places", style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: kBlackColor
              ),),
            ),
            GestureDetector(
              onTap: () {
                // Get.toNamed(RoutesName.homeScreen);
              },
              child: PlaceCard(
                placeName: "Home",
                placeQuality: "Good",
                ppm: "652",
                ppmPercentage: "13%",
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.toNamed(RoutesName.homeScreen);
              },
              child: PlaceCard(
                placeName: "Office",
                placeQuality: "Healthy",
                ppm: "447",
                ppmPercentage: "37%",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2EC773),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

}


