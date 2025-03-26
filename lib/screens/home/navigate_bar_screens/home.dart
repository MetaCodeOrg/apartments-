import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/controller/auth_controller.dart';
import 'package:flutter_app/screens/home/widget/property_card.dart';
import 'package:flutter_app/screens/home/widget/rental_property_card.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildFeaturedProperties(),
          const SizedBox(height: 10),
          _buildRentalProperties(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person_outline, color: Colors.grey[800]),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              onPressed: () => {Get.toNamed('/setting')},
              icon: Icon(Icons.settings_outlined, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text("ابحث هنا..."),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: const Color(0xFF5097B5),
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.tune, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProperties() {
    final properties = [
      const PropertyCard(
        image: "assets/images/home3.png",
        title: "فيلا حديثة",
        location: "بيت بوس / بجانب المدرسة الألمانية",
        rating: 3.5,
      ),
      const PropertyCard(
        image: "assets/images/home4.png",
        title: "المدينة السكنية",
        location: "حدة / المدينة السكنية",
        rating: 4,
      ),
      const PropertyCard(
        image: "assets/images/home3.png",
        title: "فيلا حديثة",
        location: "بيت بوس / بجانب المدرسة الألمانية",
        rating: 3.5,
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الشقق المعروضة",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("اكتشف الكل"),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 20,
            ),
            itemCount: properties.length,
            separatorBuilder: (context, index) => const SizedBox(width: 5), // مسافة ثابتة
            itemBuilder: (context, index) => properties[index],
          ),
        ),
      ],
    );
  }

  Widget _buildRentalProperties() {
    final rentalProperties = [
      const RentalPropertyCard(
        image: "assets/images/home1.png",
        title: "عمارة خالد إلا الله",
        location: "حدة / المدينة السكنية",
        rating: 4,
      ),
      const RentalPropertyCard(
        image: "assets/images/home2.png",
        title: "عمارة الوحدة",
        location: "حدة / المدينة السكنية",
        rating: 3,
      ),
      const RentalPropertyCard(
        image: "assets/images/home3.png",
        title: "عمارة القباطي",
        location: "حدة / المدينة السكنية",
        rating: 3,
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "شقق للإيجار",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("اكتشف الكل"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: rentalProperties.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => rentalProperties[index],
          ),
        ),
      ],
    );
  }
}
