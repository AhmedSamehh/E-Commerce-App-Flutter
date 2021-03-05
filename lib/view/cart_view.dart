import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/home_view_model.dart';
import 'package:ECommerce/view/widgets/custom_button.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Image.network(controller.products[index].imageUrl,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.width * 0.3),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: controller.products[index].title,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(height: 5),
                                  CustomText(
                                    text: controller.products[index].price +
                                        " EGP",
                                    color: primaryColor,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: EdgeInsets.all(5),
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        SizedBox(width: 20),
                                        CustomText(text: "0"),
                                        SizedBox(width: 20),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 15.0),
                                          child: Icon(Icons.minimize),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                     );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10);
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomText(text: "TOTAL", color: Colors.grey),
                          CustomText(
                              text: "1000 EGP", color: primaryColor
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 50),
                    Expanded(
                      child: CustomButton(
                          text: "CHECKOUT", textColor: Colors.white, onPressed: () {}
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
