import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({super.key});

  @override
  State<RedeemPage> createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Redeem"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Section: Coupons
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.ticketAlt, color: AppColors.text),
                title: Text("Available Coupons",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),

              _DisposalCard(
                
                title: "Cargills",
                discount: "10%",
                description:
                    "Rinse bottles and containers before recycling. Avoid mixing with food waste.",
              ),
              _DisposalCard(
               
                title: "Keels",
                discount: "15%",
                description:
                    "Keep papers dry and fold cardboard flat before placing into bins.",
              ),
              _DisposalCard(
                
                title: "Nestle",
                discount: "15%",
                description:
                    "Do not throw electronics in normal bins. Use designated e-waste centers.",
              ),
              _DisposalCard(
                
                title: "Imorich",
                discount: "15%",
                description:
                    "Use green bins for compostable items like food scraps and garden waste.",
              ),
              _DisposalCard(
                
                title: "CocaCola",
                discount: "15%",
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  backgroundColor: AppColors.olive,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Redeem History",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DisposalCard extends StatelessWidget {
  final String title;
  final String discount;
  final String description;

  const _DisposalCard({
    required this.title,
    required this.discount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      // Wrap the Row in an IntrinsicHeight widget
      child: IntrinsicHeight(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                ),
                color: AppColors.fadedDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(discount,
                          style: const TextStyle(
                              fontSize: 24, color: AppColors.background)
                          ),
                      Text('Off',
                      style: const TextStyle(
                          fontSize: 24, color: AppColors.background)
                      ),
                    ]
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[ 
                          Text(title,
                            style: const TextStyle(
                                fontSize: 19.42,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text)
                          ),
                          const SizedBox(width: 8),
                          Text('Coupon',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: AppColors.text)
                          ),                      
                        ],
                      ),                      
                      const SizedBox(height: 8),
                      Text(
                        description,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.text),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[ 
                          Text("Redeem with",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.grayDark
                                )
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.stars, color: AppColors.accent),
                            label: const Text('400',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white)
                            ),                            
                            style: ElevatedButton.styleFrom(    
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),            
                              backgroundColor: AppColors.fadedDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                            ),
                            ),
                          ),                      
                        ],
                      ), 
                    ],
                  ),
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
      leading: const Icon(Icons.check_circle, color: AppColors.grayDark),
      title: Text(tip, style: const TextStyle(fontSize: 14)),
    );
  }
}
