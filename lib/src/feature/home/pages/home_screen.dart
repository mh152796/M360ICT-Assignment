import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_360_assignment/src/core/core_export.dart';
import 'package:m_360_assignment/src/feature/home/widgets/history_line_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 8,
          left: 8,
          right: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromRGBO(131, 131, 131, 1),
                      ),
                    ),
                    Image.asset(AssetsPath.homeIcon, height: 24, width: 24),
                    Gap(5),
                    Text(
                      "Home",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: kBlackColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(66, 213, 139, 1),
                        Color.fromRGBO(101, 212, 156, 1),
                        Color.fromRGBO(71, 186, 128, 1),
                        Color.fromRGBO(45, 242, 143, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Good",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Gap(15),
            // HistoryLineChart(),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "652",
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: kGreenColor,
                  ),
                ),
                const Gap(8),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            "13%",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'ppm',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: kGreenColor,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(width: 100, child: StatusBar()),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  final int selectedIndex; // Index where the triangle should point

  StatusBar({this.selectedIndex = 3});

  final List<Color> barColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Triangle Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(barColors.length, (index) {
            return Expanded(
              child: Center(
                child:
                    index == selectedIndex
                        ? Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 24,
                          color: barColors[index],
                        )
                        : SizedBox(height: 8),
              ),
            );
          }),
        ),

        // Colored Bars
        Row(
          children:
              barColors
                  .map(
                    (color) => Expanded(
                      child: Container(height: 8, width: 8, color: color),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
