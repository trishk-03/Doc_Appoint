import 'package:flutter/material.dart';

// CATEGORY CHIP WIDGET


class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(right: w * 0.03),
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.045,
        vertical: h * 0.012,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w * 0.06),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: w * 0.038,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


// DOCTOR CARD WIDGET


class DoctorCard extends StatelessWidget {
  final String category;
  final String name;
  final String price;
  final String rating;
  final int slots;
  final String date;
  final String image;

  const DoctorCard({
    super.key,
    required this.category,
    required this.name,
    required this.price,
    required this.rating,
    required this.slots,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(w * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: w * 0.04,
            offset: Offset(0, h * 0.005),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- RATING + FAVOURITE ---
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.02,
                  vertical: h * 0.005,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(w * 0.03),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, size: w * 0.045, color: Colors.orange),
                    SizedBox(width: w * 0.01),
                    Text(
                      rating,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(Icons.favorite_border, size: w * 0.06)
            ],
          ),

          SizedBox(height: h * 0.02),

          // --- DOCTOR IMAGE + DETAILS ---
          Row(
            children: [
              Container(
                width: w * 0.22,
                height: w * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.04),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: w * 0.05),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: w * 0.034,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: h * 0.005),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: w * 0.036,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: h * 0.02),

          // --- AVAILABILITY + DATE BUTTON ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Availability",
                    style: TextStyle(fontSize: w * 0.036),
                  ),
                  SizedBox(width: w * 0.015),
                  Text(
                    "• $slots Slots",
                    style: TextStyle(
                      fontSize: w * 0.036,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.05,
                  vertical: h * 0.012,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(w * 0.07),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: w * 0.015),
                    Icon(Icons.arrow_forward_ios, size: w * 0.035),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
