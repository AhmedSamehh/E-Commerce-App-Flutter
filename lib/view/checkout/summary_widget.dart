import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/cart_view_model.dart';
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
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 350,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            controller.productsList[index].imageUrl,
                            width: 220,
                            height: 220,
                            fit: BoxFit.fill,
                          )
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: controller.productsList[index].title,
                          maxLines: 1,
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: controller.productsList[index].price + " EGP",
                          color: primaryColor,
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
              CustomText(text: "42 Alex St.,108 Se Bless St.,Victoria City,Oponse State", color: Colors.grey),
              SizedBox(height: 10),
              CustomText(text: "Change", color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
