import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'truck-state.dart';


class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  Position? position;

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

    Position currentposition = await Geolocator.getCurrentPosition();

    setState((){
      position = currentposition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Trucks & Bins
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFCCFF00),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Status",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          actions: const [
            Icon(Icons.notifications_none, color: Colors.black),
            SizedBox(width: 12),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.local_shipping), text: "Trucks"),
              Tab(icon: Icon(Icons.delete), text: "Bins"),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              // Trucks Tab
              Column(
          children: [
            Expanded(
              child: position == null
                  ? const Center(child: CircularProgressIndicator())
                  : FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(position!.latitude, position!.longitude),
                        initialZoom: 15,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                          userAgentPackageName: 'com.example.eco_change',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(position!.latitude, position!.longitude),
                              width: 60,
                              height: 120,
                              child: const Icon(
                                Icons.local_shipping,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        // Attribution overlay (bottom-right)
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () => launchUrl(
                              Uri.parse('https://www.openstreetmap.org/copyright'),
                            ),
                            child: Container(
                              color: Colors.white70,
                              padding: const EdgeInsets.all(4),
                              child: const Text(
                                '© OpenStreetMap contributors',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 20),
            //const Spacer(),
            TruckStatusTracker(),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: AppColors.olive,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
                ),
                child: const Text(
            "Get Directions",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
              ),

              // Bins Tab (Map Only)
              position == null
            ? const Center(child: CircularProgressIndicator())
            : FlutterMap(
                options: MapOptions(
            initialCenter:
                LatLng(position!.latitude, position!.longitude),
            initialZoom: 15,
                ),
                children: [
            TileLayer(
              urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(
                position!.latitude, position!.longitude),
                  width: 60,
                  height: 60,
                  child: const Icon(
              Icons.delete,
              color: Colors.green,
              size: 40,
                  ),
                ),
              ],
            ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _statusButton(
    IconData icon,
    String text,
    Color bgColor,
    Color textColor,
    Color borderColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 20),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
