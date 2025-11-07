import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisposalGuidePage extends StatelessWidget {
  const DisposalGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Disposal Guide"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                "Learn how to properly dispose of waste items to keep your city clean and eco-friendly.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Section: Categories
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.recycle, color: AppColors.text),
                title: Text("Waste Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),

              _DisposalCard(
                icon: FontAwesomeIcons.bottleWater,
                title: "Plastics",
                description:
                    "Rinse bottles and containers before recycling. Avoid mixing with food waste.",
              ),
              _DisposalCard(
                icon: FontAwesomeIcons.newspaper,
                title: "Paper & Cardboard",
                description:
                    "Keep papers dry and fold cardboard flat before placing into bins.",
              ),
              _DisposalCard(
                icon: FontAwesomeIcons.batteryFull,
                title: "E-Waste",
                description:
                    "Do not throw electronics in normal bins. Use designated e-waste centers.",
              ),
              _DisposalCard(
                icon: FontAwesomeIcons.appleWhole,
                title: "Organic Waste",
                description:
                    "Use green bins for compostable items like food scraps and garden waste.",
              ),
              _DisposalCard(
                icon: FontAwesomeIcons.trash,
                title: "General Waste",
                description:
                    "Non-recyclables should be placed in black bins. Avoid mixing with recyclables.",
              ),

              const SizedBox(height: 20),

              // Section: Tips
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.lightbulb, color: AppColors.text),
                title: Text("Quick Tips",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),

              _TipItem("Use separate bins for recyclable and non-recyclable waste."),
              _TipItem("Check collection schedules for hazardous waste."),
              _TipItem("Reduce single-use plastics whenever possible."),
              _TipItem("Compost organic waste to create natural fertilizer."),
            ],
          ),
        ),
      ),
    );
  }
}

class _DisposalCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _DisposalCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: AppColors.text),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.text)),
                  const SizedBox(height: 6),
                  Text(description,
                      style: const TextStyle(fontSize: 14, color: AppColors.text)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TipItem extends StatelessWidget {
  final String tip;
  const _TipItem(this.tip);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_circle, color: Colors.green),
      title: Text(tip, style: const TextStyle(fontSize: 14)),
    );
  }
}
