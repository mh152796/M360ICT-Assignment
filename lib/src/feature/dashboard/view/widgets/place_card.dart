import '../../../../core/core_export.dart';

class PlaceCard extends StatelessWidget {
  final String placeName;
  final String placeQuality;
  final String ppm;
  final String ppmPercentage;
  const PlaceCard({super.key, required this.placeName, required this.placeQuality, required this.ppm, required this.ppmPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(248, 255, 251, 1), Color.fromRGBO(254, 255, 255, 1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                placeName,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromRGBO(66, 213, 139, 1),
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
                  placeQuality,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const Gap(16),

          // PPM Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ppm,
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: kGreenColor,
                    ),
                  ),
                  const  Gap(8),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Row(
                          children: [
                            Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
                            Text(
                              ppmPercentage,
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
                ],
              ),

              OverlappingProfiles()
            ],
          ),

        ],
      ),
    );
  }
}

class OverlappingProfiles extends StatelessWidget {
  final List<String> imageUrls = [
    'https://randomuser.me/api/portraits/men/1.jpg',
    'https://randomuser.me/api/portraits/women/2.jpg',
    'https://randomuser.me/api/portraits/men/3.jpg',
    'https://randomuser.me/api/portraits/women/4.jpg',
    'https://randomuser.me/api/portraits/men/5.jpg',
  ];

  OverlappingProfiles({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:
          [
            for (int i = 0; i < 5; i++)
              Align(
                widthFactor: .5,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: i + 1 == imageUrls.length? CircleAvatar(
                      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                      child: Text(
                        "+47",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 14
                        ),),
                    )  : ClipOval(
                      child: Image.network(
                        imageUrls[i],
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 50),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Handle tap
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View Details',
                style: GoogleFonts.poppins(
                  color: kGreenColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Icon(Icons.play_arrow, color: kGreenColor),
            ],
          ),
        ),
      ],
    );
  }
}
