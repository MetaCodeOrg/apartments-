import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/controller/auth_controller.dart';
import 'package:flutter_app/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class NewPass extends StatelessWidget {
  NewPass({super.key});
  final AuthController controller = Get.find<AuthController>();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'استعادة كلمة المرور',
                      style: TextStyle(
                        color: Color.fromARGB(255, 92, 157, 175),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'ادخل كلمة المرور الجديدة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// حقل إدخال رقم الجوال
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: controller.phoneNum,
                        hintText: '  كلمة المرور الجديدة ',
                        labelText: 'كلمة المرور ',
                        suffixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال رقم الجوال';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: controller.phoneNum,
                        hintText: ' تأكيد كلمة المرور  ',
                        labelText: 'تأكيد كلمة المرور ',
                        suffixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال رقم الجوال';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50),

                      /// زر إرسال كود التحقق
                      Obx(() {
                        return controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 92, 157, 175),
                                  ),
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      await controller.loginFunc();
                                      // return 'please enter your number';
                                      Get.toNamed('/home');
                                    } else {
                                      Get.toNamed('/home');
                                    }
                                  },
                                  child: const Text(
                                    '  تغيير كلمة المرور',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              color: const Color(0xFF9ccddb),
            ),

            /// المساحة السفلية الزرقاء
            Container(
              height: MediaQuery.of(context).size.height * 0.16,
              color: const Color.fromARGB(255, 92, 157, 175),
            ),
          ],
        ),
      ),
    );
  }
}
