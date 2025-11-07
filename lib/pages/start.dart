import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'card.dart';
import 'status.dart';
import 'disposal.dart';
import 'redeem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_location_code/open_location_code.dart';
import 'package:fluttertoast/fluttertoast.dart';



class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Position? position;
  String? plusCode;
  @override
  void initState() {
    super.initState();
    fetchposition();
  }
fetchposition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Location services are disabled");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location permissions are denied");
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              "Location permissions are permanently denied, we cannot request permissions.");
      return;
    }

    Position currentposition =
        await Geolocator.getCurrentPosition();

    setState(() {
      position = currentposition;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false, // removes back button
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    position == null
                        ? "Locating..."
                        : "${position!.latitude}, ${position!.longitude}",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),

               
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RedeemPage()),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.stars),
                    SizedBox(width: 4),
                    Text("1400",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
               )
              )
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const SizedBox(height: 16),
                const Text("Good Morning, Sashin!",
                    style: TextStyle(fontSize: 22)),
                const SizedBox(height: 16),
                // Eco Change Progress
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: AppColors.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),                    
                    //backgroundColor: AppColors.primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Your Eco Change",
                                          style: TextStyle(
                                            fontSize: 19.42,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                          SizedBox(height: 9),
                                          Text("Complete and get"),
                                          SizedBox(height: 9),
                                          Row(
                                            children: [
                                              Icon(Icons.stars, color: AppColors.text),
                                              SizedBox(width: 4),
                                              Text("50", style: TextStyle(color: AppColors.text,  fontSize: 18),),
                                            ]
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 14),
                                    Row(
                                      children: [
                                        const Text("See in details"),
                                        const SizedBox(width: 4),
                                        Icon(Icons.arrow_forward, color: AppColors.text),
                                      ]
                                    )                                    
                                  ],
                                ),
                                SizedBox(
                                width: 144,
                                height: 144,
                                child: CircularPercentIndicator(
                                  animation: true,
                                  animationDuration: 800,
                                  radius: 72,
                                  lineWidth: 11.34,
                                  backgroundColor: AppColors.secondary,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: AppColors.olive,
                                  center: const Text(
                                    "2.5/7 kg",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  percent: 2.5 / 7,
                                ),
                              )
                                                        
                           
                          ],
                          
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Vehicle Info
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  color: const Color(0xFF9CD80F), // bright green background
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_shipping, color: Colors.black, size: 54),
                            const SizedBox(width: 10),
                            Text(
                              "Vehicle",
                              style: const TextStyle(
                                fontSize: 18,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "KLP 1651",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "scheduled for 2025/06/23 at 9 a.m",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const StatusScreen()),
                              );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFDE7), // light cream background
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              //mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Not started yet",
                                  style: TextStyle(
                                    fontSize: 14,
                                    //fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                //Spacer(),
                                //SizedBox(width: 64),
                                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                

                const SizedBox(height: 16),

                // Latest News & Events
                const ListTile(
                  leading: Icon(Icons.article),
                  title: Text("Latest News & Events", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),

                SizedBox(
                  height: 128,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // Set padding to zero to remove the space
                    padding: EdgeInsets.zero,
                    children: [
                      CustomCard(),
                      const SizedBox(width: 6), // This correctly adds space BETWEEN cards
                      CustomCard(),
                      const SizedBox(width: 6),
                      CustomCard(),
                    ],
                  ),
                )
                ,

                const SizedBox(height: 16),
                const ListTile(
                  leading: FaIcon(FontAwesomeIcons.leaf, color: AppColors.text), // real leaf 🌱
                  title: Text("Eco Help", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                // const Text("Eco Help",
                //     style:
                //         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                //const SizedBox(height: 12),

                // Eco Help Grid
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _EcoHelpCard(
                      icon: FontAwesomeIcons.route,
                      title: "Disposal Guide",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DisposalGuidePage()),
                        );
                      },
                    ),
                    const _EcoHelpCard(icon: FontAwesomeIcons.newspaper, title: "News & Events"),
                    const _EcoHelpCard(icon: FontAwesomeIcons.podcast, title: "Live Eco Cast"),
                    const _EcoHelpCard(icon: FontAwesomeIcons.trashCan, title: "Installation Guide"),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EcoHelpCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap; // new

  const _EcoHelpCard({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // makes card tappable
      borderRadius: BorderRadius.circular(12),
      child: Card(
        color: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 44, color: AppColors.text),
              const SizedBox(height: 8),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: AppColors.text)),
            ],
          ),
        ),
      ),
    );
  }
}
