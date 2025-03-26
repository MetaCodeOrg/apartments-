import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/about.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/home.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/search.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/setting.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const AboutPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "البحث",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "معلومات عنا",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "الإعدادات",
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_app/screens/auth/controller/auth_controller.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0; // لتحديد الصفحة المحددة

//   // قائمة الصفحات
//   final List<Widget> _pages = [
//     const HomePage(),
//     const SearchPage(),
//     const AboutPage(),
//     const SettingsPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         //   appBar: AppBar(
//         //   actions: [
//         //     GetBuilder<AuthController>(builder: (controller) {
//         //       return ElevatedButton(
//         //         onPressed: () {
//         //           controller.logout();
//         //         },
//         //         child: const Text("تسجيل خروج"),
//         //       );
//         //     })
//         //   ],
//         //   title: const Text('Home page'),
//         // ),
//         body: SafeArea(
//           child: IndexedStack(
//             index: _selectedIndex, // يعرض الصفحة المحددة
//             children: _pages,
//           ),
//         ),
//         // Bottom Navigation Bar
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.grey,
//           currentIndex: _selectedIndex, // تحديد العنصر المحدد
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index; // تحديث الصفحة المحددة
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined),
//               label: "الرئيسية",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: "البحث",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.info_outline),
//               label: "معلومات عنا",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings_outlined),
//               label: "الإعدادات",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // صفحة الرئيسية
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Header with settings and profile icons
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.grey[200],
//                   child: Icon(Icons.person_outline, color: Colors.grey[800]),
//                 ),
//                 CircleAvatar(
//                     backgroundColor: Colors.grey[200],
//                     child: GetBuilder<AuthController>(builder: (controller) {
//                       return IconButton(
//                         onPressed: () {
//                           controller.logout();
//                         },
//                         icon: const Icon(Icons.settings_outlined),
//                         color: Colors.grey[800],
//                         iconSize: 25,
//                       );
//                     })),
//               ],
//             ),
//           ),

//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Card(
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Row(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 16),
//                             child: Icon(Icons.search, color: Colors.grey),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                               child: Text(
//                                 "ابحث هنا...",
//                                 style: TextStyle(color: Colors.grey[600]),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 CircleAvatar(
//                   backgroundColor: const Color(0xFF5097B5),
//                   radius: 20,
//                   child: IconButton(
//                     icon: const Icon(Icons.tune, color: Colors.white),
//                     onPressed: () {
//                       // إضافة الوظيفة المطلوبة هنا
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Featured Properties Section
//           Column(
//             children: [
//               // الشقق المعروضة Section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "الشقق المعروضة",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[700],
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         "اكتشف الكل",
//                         style: TextStyle(
//                             color: Colors.grey[700], fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Featured Properties Horizontal Scroll
//               SizedBox(
//                 height: 230,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   children: [
//                     PropertyCard(
//                       image: "assets/images/home3.png",
//                       title: "فيلا حديثة",
//                       location: "بيت بوس / بجانب المدرسة الألمانية",
//                       rating: 3.5,
//                     ),
//                     PropertyCard(
//                       image: "assets/images/home4.png",
//                       title: "المدينة السكنية",
//                       location: "حدة / المدينة السكنية",
//                       rating: 4,
//                     ),
//                     PropertyCard(
//                       image: "assets/images/home1.png",
//                       title: "المدينة السكنية",
//                       location: "حدة / المدينة السكنية",
//                       rating: 4,
//                     ),
//                   ],
//                 ),
//               ),
//               // Rental Properties Section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "شقق للإيجار",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[700],
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         "اكتشف الكل",
//                         style: TextStyle(
//                             color: Colors.grey[700], fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Vertical List of Rental Properties
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const ClampingScrollPhysics(),
//                   children: [
//                     RentalPropertyCard(
//                       image: "assets/images/home1.png",
//                       title: "عمارة خالد إلا الله",
//                       location: "حدة / المدينة السكنية",
//                       rating: 4,
//                     ),
//                     const SizedBox(height: 16),
//                     RentalPropertyCard(
//                       image: "assets/images/home2.png",
//                       title: "عمارة الوحدة",
//                       location: "حدة / المدينة السكنية",
//                       rating: 3,
//                     ),
//                     const SizedBox(height: 16),
//                     RentalPropertyCard(
//                       image: "assets/images/home3.png",
//                       title: "عمارة القباطي",
//                       location: "حدة / المدينة السكنية",
//                       rating: 3,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // صفحة البحث
// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("صفحة البحث"),
//     );
//   }
// }

// // صفحة معلومات عنا
// class AboutPage extends StatelessWidget {
//   const AboutPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("صفحة معلومات عنا"),
//     );
//   }
// }

// // صفحة الإعدادات
// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("صفحة الإعدادات"),
//     );
//   }
// }

// // باقي الكلاسات (PropertyCard و RentalPropertyCard) تبقى كما هي

// class PropertyCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final String location;
//   final double rating;

//   const PropertyCard({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.location,
//     required this.rating,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 180,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(16),
//               topRight: Radius.circular(16),
//             ),
//             child: Image.asset(
//               image,
//               height: 120,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         location,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     for (int i = 0; i < 5; i++)
//                       Icon(
//                         i < rating ? Icons.star : Icons.star_border,
//                         color: Colors.amber,
//                         size: 16,
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RentalPropertyCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final String location;
//   final double rating;

//   const RentalPropertyCard({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.location,
//     required this.rating,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // الصورة على اليسار
//           Expanded(
//             flex: 4,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 bottomLeft: Radius.circular(16),
//               ),
//               child: Image.asset(
//                 image,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // العنوان والموقع والتقييم على اليمين
//           Expanded(
//             flex: 6,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
//                       const SizedBox(width: 4),
//                       Expanded(
//                         child: Text(
//                           location,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       for (int i = 0; i < 5; i++)
//                         Icon(
//                           i < rating ? Icons.star : Icons.star_border,
//                           color: Colors.amber,
//                           size: 16,
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
