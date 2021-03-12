import 'package:ECommerce/constant.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 50),
            RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              activeColor: primaryColor,
              onChanged: (Delivery value){
                setState(() {
                  delivery = value;
                });
              },
              title: CustomText(
                text: "Standard Delivery",
                fontSize: 24
              ),
              subtitle: CustomText(
                text: "\n Order will be delivered between 3~5 Business days",
              ),
            ),
            SizedBox(height: 50),

            RadioListTile<Delivery>(
              value: Delivery.NextDayDelivery,
              groupValue: delivery,
              activeColor: primaryColor,
              onChanged: (Delivery value){
                setState(() {
                  delivery = value;
                });
              },
              title: CustomText(
                  text: "Next Day Delivery",
                  fontSize: 24
              ),
              subtitle: CustomText(
                text: "\n Place Your Order before 6PM and Your items will be delivered the next day",
              ),
            ),
            SizedBox(height: 50),
            RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue: delivery,
              activeColor: primaryColor,
              onChanged: (Delivery value){
                setState(() {
                  delivery = value;
                });
              },
              title: CustomText(
                  text: "Nominated Delivery",
                  fontSize: 24
              ),
              subtitle: CustomText(
                text: "\n Pick a particular date from the calendar and the order will be delivered on selected date",
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
