// import 'package:flutter/material.dart';

// class PropertyDetailsPage extends StatelessWidget {
//   final String image;
//   final String title;
//   final String location;
//   final double rating;
//   final bool isFurnished;

//   const PropertyDetailsPage({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.location,
//     required this.rating,
//     required this.isFurnished,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           centerTitle: true,
//           backgroundColor: Colors.teal[700],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               // صورة الشقة الرئيسية
//               Container(
//                 height: 250,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(image),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               // معلومات الشقة
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[800],
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on, size: 20, color: Colors.grey[600]),
//                         SizedBox(width: 4),
//                         Text(
//                           location,
//                           style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),

//                     // التقييم
//                     Row(
//                       children: [
//                         for (int i = 0; i < 5; i++)
//                           Icon(
//                             i < rating ? Icons.star : Icons.star_border,
//                             color: Colors.amber,
//                             size: 24,
//                           ),
//                         SizedBox(width: 8),
//                         Text(
//                           rating.toString(),
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),

//                     // نوع الشقة
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                       decoration: BoxDecoration(
//                         color: isFurnished ? Colors.teal[100] : Colors.blue[100],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         isFurnished ? "شقة مفروشة" : "شقة للإيجار",
//                         style: TextStyle(
//                           color: isFurnished ? Colors.teal[800] : Colors.blue[800],
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),

//                     // مميزات الشقة
//                     Text(
//                       "مميزات الشقة:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     ..._buildFeaturesList(isFurnished),
//                     SizedBox(height: 30),

//                     // زر الحجز
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.teal[700],
//                           padding: EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "طلب تأجير",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildFeaturesList(bool isFurnished) {
//     final features = isFurnished
//         ? [
//             "غرفتي نوم رئيسية",
//             "صالة استقبال واسعة",
//             "مطبخ مجهز بالكامل",
//             "أثاث فاخر",
//             "خدمات تنظيف يومية",
//             "حديقة خاصة"
//           ]
//         : ["3 غرف نوم", "صالة كبيرة", "مطبخ", "2 حمام", "مواقف سيارات", "شرفة واسعة"];

//     return features
//         .map((feature) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 6),
//               child: Row(
//                 children: [
//                   Icon(Icons.check_circle, color: Colors.teal, size: 20),
//                   SizedBox(width: 8),
//                   Text(feature, style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//             ))
//         .toList();
//   }
// }

// import 'package:flutter/material.dart';

// class FurnishedApartmentDetails extends StatelessWidget {
//   final String title;
//   final String location;
//   final List<String> features;
//   final String description;

//   const FurnishedApartmentDetails({
//     Key? key,
//     required this.title,
//     required this.location,
//     required this.features,
//     required this.description,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           centerTitle: true,
//           backgroundColor: Colors.teal[700],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // صورة الشقة
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: DecorationImage(
//                       image: AssetImage("assets/images/apartment1.jpg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
                
//                 // العنوان والموقع
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.teal[800],
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(Icons.location_on, color: Colors.grey[600], size: 18),
//                     SizedBox(width: 4),
//                     Text(
//                       location,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(height: 30, thickness: 1),
                
//                 // المميزات
//                 Text(
//                   "تتكون من:",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ...features.map((feature) => Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   child: Row(
//                     children: [
//                       Icon(Icons.circle, size: 8, color: Colors.teal),
//                       SizedBox(width: 8),
//                       Text(
//                         feature,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 )).toList(),
//                 Divider(height: 30, thickness: 1),
                
//                 // الوصف
//                 Text(
//                   "الوصف:",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   description,
//                   style: TextStyle(fontSize: 16, height: 1.5),
//                 ),
//                 SizedBox(height: 30),
                
//                 // أزرار القاع
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.teal[700],
//                         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text("طلب تأجير", style: TextStyle(fontSize: 16)),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text("المفضلة", style: TextStyle(color: Colors.teal[700])),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: Container(
//           height: 60,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, -2),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(icon: Icon(Icons.settings), onPressed: () {}),
//               IconButton(icon: Icon(Icons.info_outline), onPressed: () {}),
//               IconButton(icon: Icon(Icons.share), onPressed: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }