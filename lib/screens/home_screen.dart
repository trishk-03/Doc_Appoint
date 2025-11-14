import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_appoint/ui_helpers/widgets.dart';
import 'package:doc_appoint/services/doctor_services.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late MotionTabBarController tabBarController;

  @override
  void initState() {
    super.initState();
    tabBarController = MotionTabBarController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color darkText = Colors.black87;
    final DoctorService doctorService = DoctorService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),

                // APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "DocAppoint 🩺",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.search_sharp, size: 26, color: darkText),
                        const SizedBox(width: 20),
                        Icon(Icons.notifications_none, size: 26, color: darkText)
                      ],
                    )
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                // CATEGORY TITLE
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 15),

                // CATEGORY LISTVIEW
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategoryChip(label: "Neurologist"),
                      CategoryChip(label: "Cardiologist"),
                      CategoryChip(label: "Dermatologist"),
                      CategoryChip(label: "Pediatrician"),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                // TOP DOCTORS HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Top Doctors",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                //  ---- FETCH DOCTORS FROM FIRESTORE ----
                StreamBuilder<QuerySnapshot>(
                  stream: doctorService.getAllDoctors(),
                  builder: (context, snapshot) {
                    // debug prints (optional)
                    // print("SNAPSHOT HAS DATA: ${snapshot.hasData}");
                    // print("DOC COUNT: ${snapshot.data?.docs.length}");
                    // print("ERROR: ${snapshot.error}");

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text(
                        "No doctors found",
                        style: TextStyle(fontSize: 16),
                      );
                    }

                    final docs = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: docs.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final doc = docs[index];
                        final data = (doc.data() as Map<String, dynamic>?) ?? {};

                        final category = data['category'] as String? ?? 'Unknown';
                        final name = data['name'] as String? ?? 'No Name';
                        final price = data['price']?.toString() ?? 'N/A';
                        final rating = data['rating']?.toString() ?? '0';
                        final slots = data['slots'] is int
                            ? data['slots'] as int
                            : int.tryParse(data['slots']?.toString() ?? '') ?? 0;
                        final date = data['date'] as String? ?? 'No Date';
                        final image = data['image'] as String? ?? '';

                        return Column(
                          children: [
                            DoctorCard(
                              category: category,
                              name: name,
                              price: price,
                              rating: rating,
                              slots: slots,
                              date: date,
                              image: image,
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MotionTabBar(
        controller: tabBarController,
        initialSelectedTab: 'Home',
        onTabItemSelected: (tab){
          tabBarController.index = tab;
          setState(() {

          });
        },
        labels: const ['Home', 'Appointments', 'Profile'],
        icons: const [
          Icons.home_filled,
          Icons.calendar_month,
          Icons.person,
        ],
      ),
    );
  }
}
