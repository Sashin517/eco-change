import 'package:flutter/material.dart';
import '../colors.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  String selectedCategory = "";
  final TextEditingController detailsController = TextEditingController();

  // complaint data
  final List<Map<String, dynamic>> complaints = [
    {"id": 1, "category": "Truck", "status": "Pending"},
    {"id": 2, "category": "Bin", "status": "Resolved"},
    {"id": 3, "category": "Coupon", "status": "Pending"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: AppColors.primary,
        title: const Text(
          "Submit a Complaint",
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Select Category
              const Text(
                "Select Complaint Category",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: ["Truck", "Bin", "Coupon"].map((category) {
                  final isSelected = selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory =
                              selected ? category : selectedCategory;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 12),
              const Text(
                "Please choose one category.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Details Field
              const Text(
                "Details",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: detailsController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Describe your complaint here...",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Provide as much detail as possible.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Upload Photo
              const Text(
                "Upload Photo",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  // picker here
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Choose a photo to upload",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Icon(Icons.upload_file, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Optional: Attach any relevant images.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.olive,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                    onPressed: () {
                    // Handle complaint submit
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                      content: Text('Successfully added your complaint'),
                      backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text(
                    "Submit Complaint",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Past Complaints
              const Text(
                "Past Complaints",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your previous submissions",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  final complaint = complaints[index];
                  final isResolved = complaint["status"] == "Resolved";
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Icon(
                        isResolved
                            ? Icons.check_circle
                            : Icons.pending_actions,
                        color: isResolved
                            ? Colors.green
                            : Colors.orange,
                      ),
                      title: Text("Complaint #${complaint["id"]}"),
                      subtitle: Text("Category: ${complaint["category"]}"),
                      trailing: Text(
                        "Status: ${complaint["status"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isResolved ? Colors.green : Colors.orange,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
