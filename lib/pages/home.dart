import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
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
                children: const [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 4),
                  Text("SJP Campus, Meepe, Padukka",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.stars),
                  SizedBox(width: 4),
                  Text("1400",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                ],
              )
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.primary, // ✅ background color here
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Complaint"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(
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
                                  height: 128,
                                  width: 128,
                                  child: CircularPercentIndicator(
                                    animation: true,
                                    animationDuration: 800,
                                    radius: 64,
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
                                    percent: 2.5 / 7, // Example percent value
                                  ),
                                ),                                                         
                           
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
                      borderRadius: BorderRadius.circular(12)),
                  color: AppColors.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_shipping, color: Colors.black, size: 64),
                            SizedBox(width: 10),
                            Text("Vehicle KLP 1651", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text("scheduled for 2025/06/23 at 9 a.m"),
                        SizedBox(height: 6),
                        Text("Not started yet",
                            style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Latest News & Events
                const ListTile(
                  leading: Icon(Icons.article),
                  title: Text("Latest News & Events"),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Today schedule vehicle has been broken sorry for your inconvenience, next trip will be updated soon"),
                        SizedBox(height: 6),
                        Text("6 hours ago",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text("Eco Help",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                const SizedBox(height: 12),

                // Eco Help Grid
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: const [
                    _EcoHelpCard(icon: Icons.delete, title: "Disposal Guide"),
                    _EcoHelpCard(icon: Icons.event, title: "News & Events"),
                    _EcoHelpCard(icon: Icons.live_tv, title: "Live Eco Cast"),
                    _EcoHelpCard(
                        icon: Icons.settings, title: "Installation Guide"),
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

// Reusable Eco Help Card
class _EcoHelpCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _EcoHelpCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.green),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
