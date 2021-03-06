import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/cart_view_model.dart';
import 'package:ECommerce/model/cart_product.dart';
import 'package:ECommerce/model/product.dart';
import 'package:ECommerce/view/cart_view.dart';
import 'package:ECommerce/view/widgets/custom_button.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatelessWidget {
  ProductModel product;

  ProductDetailsView({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(product.imageUrl, fit: BoxFit.fill)),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomText(
                        text: product.title,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(text: "Size"),
                              CustomText(text: product.size) //product.size
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(text: "Color"),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: product.color,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4)),
                              ) //product.size
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        CustomText(
                            text: "Details",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        SizedBox(height: 20),
                        CustomText(text: product.desc, height: 1.5),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomText(text: "PRICE", color: Colors.grey),
                        CustomText(
                            text: product.price + " EGP", color: primaryColor
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 50),
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) => Expanded(
                      child: CustomButton(
                      text: "ADD", textColor: Colors.white, onPressed: () {
                        controller.addProductToCart(
                          CartProductModel(
                            productId: product.productId,
                            title: product.title,
                            imageUrl: product.imageUrl,
                            price: product.price,
                            quantity: 1
                          )
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
