import 'package:flutter/material.dart';
import '../colors.dart';




class TruckStatusTracker extends StatefulWidget {
  const TruckStatusTracker({super.key});

  @override
  State<TruckStatusTracker> createState() => _TruckStatusTrackerState();
}

class _TruckStatusTrackerState extends State<TruckStatusTracker> {
  // Controller to programmatically control the scroll position
  late final ScrollController _scrollController;
  
  // The index of the currently active status
  int _currentStatusIndex = 0;

  // Define the fixed width for each status button.
  // This is crucial for calculating the scroll position.
  final double _itemWidth = 120.0;

  // Your status data
  final List<Map<String, dynamic>> _statuses = [
    {
      "icon": Icons.block,
      "label": "Not Started",
      "activeColor": const Color(0xFFCCFF00),
      "inactiveColor": AppColors.secondary,
    },
    {
      "icon": Icons.play_arrow,
      "label": "Started",
      "activeColor": const Color(0xFFCCFF00),
      "inactiveColor": AppColors.secondary,
    },
    {
      "icon": Icons.near_me,
      "label": "Near",
      "activeColor": const Color(0xFFCCFF00),
      "inactiveColor": AppColors.secondary,
    },
    {
      "icon": Icons.check_circle,
      "label": "Passed",
      "activeColor": const Color(0xFFCCFF00),
      "inactiveColor": AppColors.secondary,
    },
    // Add more statuses if needed
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // This function is called when you want to change the status
  void _updateStatus(int newIndex) {
    if (newIndex < 0 || newIndex >= _statuses.length) return;

    setState(() {
      _currentStatusIndex = newIndex;
    });

    // Calculate the target scroll position
    double targetOffset = _itemWidth * newIndex;

    // Animate the ListView to the target position
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // The horizontal ListView must have a defined height
        SizedBox(
          height: 60, // Give the list a fixed height
          child: ListView.builder(
            // 1. Attach the controller
            controller: _scrollController,
            
            // 2. Set scroll direction
            scrollDirection: Axis.horizontal,
            
            // 3. Disable user scrolling
            physics: const NeverScrollableScrollPhysics(),
            
            padding: EdgeInsets.zero,
            itemCount: _statuses.length,
            itemBuilder: (context, index) {
              final status = _statuses[index];
              final bool isActive = index == _currentStatusIndex;

              // Give each item a fixed width
              return SizedBox(
                // width: _itemWidth,
                child: _statusButton(
                  status['icon'],
                  status['label'],
                  isActive ? status['activeColor'] : status['inactiveColor'],
                  isActive ? Colors.black : Colors.black54,
                  isActive ? Colors.black26 : Colors.black12,
                ),
              );
            },
          ),
        ),
        
        const SizedBox(height: 20),

        // --- This is just a demo control button ---
        // You would call _updateStatus based on your app's logic
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                _updateStatus(_currentStatusIndex - 1);
              },
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                _updateStatus(_currentStatusIndex + 1);
              },
            ),
          ],
        )
      ],
    )
    );
  }

  // Your _statusButton widget (recreated as a helper method)
  Widget _statusButton(IconData icon, String label, Color bgColor,
      Color fgColor, Color shadowColor) {
    return Card(
      elevation: 4,
      shadowColor: shadowColor,
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: fgColor, size: 30),
            const SizedBox(width: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: fgColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 1,
              //overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}