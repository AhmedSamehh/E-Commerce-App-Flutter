import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/cart_view_model.dart';
import 'package:ECommerce/core/view_model/checkout_view_model.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) =>
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 350,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.productsList.length,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                controller.productsList[index].imageUrl,
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: controller.productsList[index].title,
                            maxLines: 1,
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: controller.productsList[index].price + " EGP",
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index){
                      return SizedBox(width: 20);
                    },
                  ),
                ),
                SizedBox(height: 10),
                CustomText(text: "Shipping Address", fontSize: 20),
                SizedBox(height: 10),
                GetBuilder<CheckoutViewModel>(builder:(controller) =>
                    CustomText(text: controller.street1+", "+controller.street2
                        +", "+ controller.city+", "+ controller.state+", "+controller.country,
                        color: Colors.grey)
                ),
                SizedBox(height: 10),
                CustomText(text: "Change", color: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
