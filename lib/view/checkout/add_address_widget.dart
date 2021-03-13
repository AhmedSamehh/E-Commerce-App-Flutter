import 'package:ECommerce/constant.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:ECommerce/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.check_circle, color: primaryColor, size: 40),
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
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: 'Street 2',
                hint: 'Ex: 108 Se Bless St.',
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: 'City',
                hint: 'Ex: Victoria City',
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
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CustomTextFormField(
                        text: "Country",
                        hint: "Georgia",
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
