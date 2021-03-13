import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/cart_view_model.dart';
import 'package:ECommerce/core/view_model/checkout_view_model.dart';
import 'package:ECommerce/view/checkout/add_address_widget.dart';
import 'package:ECommerce/view/checkout/delivery_time_widget.dart';
import 'package:ECommerce/view/checkout/summary_widget.dart';
import 'package:ECommerce/view/widgets/custom_button.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

class CheckoutView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder:(controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black)
          ),
          title: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 105,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                  MediaQuery.of(context).size.width / _processes.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.index) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.index) {
                        final prevColor = controller.getColor(index - 1);
                        final color = primaryColor;
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
            controller.pages == Pages.DeliveryTime ? DeliveryTime()
           :controller.pages == Pages.AddAddress ? AddAddress()
            :Summary(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  controller.index > 0?
                  Expanded(
                    child: CustomButton(
                        text: "BACK",
                        textColor: primaryColor,
                        color: Colors.white,
                        onPressed: () {
                          controller.changeIndex(controller.index - 1);
                        }
                    ),
                  ):Container(),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                        text: "NEXT",
                        textColor: Colors.white,
                        onPressed: () {
                          controller.changeIndex(controller.index + 1);
                        }
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summary',
];