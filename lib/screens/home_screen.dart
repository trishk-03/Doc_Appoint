import 'package:flutter/material.dart';
import 'package:doc_appoint/ui_helpers/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color darkText = Colors.black87;

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
          
                //  APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "DocAppoint",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
          
                    Row(
                      children: [
                        Icon(Icons.search, size: 26, color: darkText),
                        const SizedBox(width: 20),
                        Icon(Icons.notifications_none, size: 26, color: darkText)
                      ],
                    )
                  ],
                ),
          
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          
                //  CATEGORY TITLE 
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
                    children:  [
                      CategoryChip(label: "Neurologist"),
                      CategoryChip(label: "Cardiologist"),
                      CategoryChip(label: "Dermatologist"),
                      CategoryChip(label: "Pediatrician"),
                    ],
                  ),
                ),
          
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          
                //  TOP DOCTORS HEADER 
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
          
                // DOCTOR CARD
                const DoctorCard(
                  category: 'Cardiologist',
                  name: 'Dr. Archit Vishnoi',
                  price: '2500 / session',
                  rating: '4.3',
                  slots: 5,
                  date: '24 December',
                  image: 'assets/images/doc_logo.png',
                ),
          
                const SizedBox(height: 20),
                
                const DoctorCard(
                  category: 'Neurologist',
                  name: 'Dr. Indresh kumar',
                  price: '1500 / session',
                  rating: '4.7',
                  slots: 7,
                  date: '10 April',
                  image: 'assets/images/doc_logo.png',
                ),
                
                const SizedBox(height: 20),
          
          
                const DoctorCard(
                  category: 'Dermatologist',
                  name: 'Dr. Jeevesh chaurasiya',
                  price: '1000 / session',
                  rating: '4.7',
                  slots: 10,
                  date: '13 October',
                  image: 'assets/images/doc_logo.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


