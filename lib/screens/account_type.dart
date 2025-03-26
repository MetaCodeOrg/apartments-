import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 98, 151, 174), Color(0xFF9DCEDC)],
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                ' نوع الحساب',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAccountTypeCard(
                    context,
                    imagePath: 'assets/images/account_type 2.png',
                    title: 'مؤجر',
                  ),
                  const SizedBox(height: 50),
                  _buildAccountTypeCard(
                    context,
                    imagePath: 'assets/images/account_type 1.png',
                    title: 'عميل',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTypeCard(BuildContext context,
      {required String imagePath, required String title}) {
    return GestureDetector(
      onTap: () {
        Get.offNamed('/register');
      },
      child: Container(
        width: 200,
        height: 180, // جعل الارتفاع ثابتًا لجميع العناصر
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                imagePath,
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFF064469),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
