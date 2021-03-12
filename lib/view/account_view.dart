import 'package:ECommerce/core/view_model/account_view_model.dart';
import 'package:ECommerce/core/view_model/control_view_model.dart';
import 'package:ECommerce/view/auth/login_view.dart';
import 'package:ECommerce/view/control_view.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        body: controller.loading.value?
        Center(child: CircularProgressIndicator())
        :Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    controller.user!=null && controller.user.img != ""?
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red,
                        image: DecorationImage(
                          image:AssetImage(controller.user.img)

                        )
                      ),
                    )
                    :CircleAvatar(
                      radius: 60,
                      child: Text("A", style: TextStyle(fontSize: 60)),
                      // child: Text(controller.user.name[0].toUpperCase()),
                    ),
                    Column(
                      children: [
                        CustomText(text: controller.user.name),
                        SizedBox(height: 10),
                        CustomText(text: controller.user.email),
                      ],
                    )
                  ]
                ),
                SizedBox(height: 10),
                Card(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title: CustomText(text: "Edit Profile"),
                      leading: Icon(Icons.edit),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title: CustomText(text: "Shipping Address"),
                      leading: Icon(Icons.location_on_outlined),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title: CustomText(text: "Order History"),
                      leading: Icon(Icons.history),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title: CustomText(text: "Cards"),
                      leading: Icon(Icons.credit_card_rounded),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title: CustomText(text: "Notifications"),
                      leading: Icon(Icons.notification_important_sharp),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: FlatButton(
                    onPressed: (){
                      controller.signOut();
                      Get.offAll(ControlView());
                    },
                    child: ListTile(
                      title: CustomText(text: "Logout"),
                      leading: Icon(Icons.logout),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
