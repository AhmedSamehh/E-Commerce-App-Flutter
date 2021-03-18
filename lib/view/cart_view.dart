import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/cart_view_model.dart';
import 'package:ECommerce/view/checkout/checkout_view.dart';
import 'package:ECommerce/view/widgets/custom_button.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) {
        return Scaffold(
          body: controller.productsList.length == 0?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('lib/assets/empty_cart.svg', width: 200, height: 200),
                SizedBox(height: 15),
                CustomText(text: "Empty Cart",color: primaryColor, alignment: Alignment.center, fontSize: 30)
              ],
            )
          :Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemCount: controller.productsList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Image.network(controller.productsList[index].imageUrl,
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
                                      text: controller.productsList[index].title,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(height: 5),
                                  CustomText(
                                    text: controller.productsList[index].price +
                                        " EGP",
                                    color: Colors.green,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          controller.increaseQuantity(index);
                                        },
                                        color: Colors.black,
                                        textColor: Colors.white,
                                        child: Icon(Icons.add, size: 20),
                                        shape: CircleBorder(),
                                      ),
                                      CustomText(
                                          text: controller.
                                          productsList[index].quantity
                                              .toString()
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          controller.decreaseQuantity(index);
                                        },
                                        color: Colors.black,
                                        textColor: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom:15),
                                          child: Icon(Icons.minimize, size: 20),
                                        ),
                                        shape: CircleBorder(),
                                      ),
                                    ],
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
                          GetBuilder<CartViewModel>(
                            builder: (controller) => CustomText(
                                text: controller.totalPrice.toString(), color: Colors.green
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 50),
                    Expanded(
                      child: CustomButton(
                          text: "CHECKOUT",
                          textColor: Colors.white,
                          onPressed: () {
                            Get.to(CheckoutView());
                          }
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
