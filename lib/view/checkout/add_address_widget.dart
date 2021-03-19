import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/checkout_view_model.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:ECommerce/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formKey,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.check_circle, color: Colors.green, size: 40),
                      ),
                      Flexible(
                        child: CustomText(
                          text: 'Billing address is the same as delivery address',
                          fontSize: 20,
                          alignment: Alignment.center
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    text: 'Street 1',
                    hint: 'Ex: 42 Alex St.',
                    onSaved: (value){
                      controller.street1 = value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Street 1 cannot be empty';
                      }
                    }
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    text: 'Street 2',
                    hint: 'Ex: 108 Se Bless St.',
                    onSaved: (value){
                      controller.street2 = value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Street 2 cannot be empty';
                      }
                    }
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    text: 'City',
                    hint: 'Ex: Victoria City',
                      onSaved: (value){
                        controller.city = value;
                      },
                      validator: (value){
                        if(value.isEmpty){
                          return 'City cannot be empty';
                        }
                      }
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomTextFormField(
                            text: "State",
                            hint: "Oponse State",
                              onSaved: (value){
                                controller.state = value;
                              },
                              validator: (value){
                                if(value.isEmpty){
                                  return 'State cannot be empty';
                                }
                              }
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomTextFormField(
                            text: "Country",
                            hint: "Georgia",
                              onSaved: (value){
                                controller.country = value;
                              },
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Country cannot be empty';
                                }
                              }
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
