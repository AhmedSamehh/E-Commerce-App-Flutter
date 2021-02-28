import 'package:ECommerce/core/view_model/control_view_model.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final List<String> list = ["Shoes","Shoes","Shoes","Shoes","Shoes","Shoes","Shoes"];

  Widget _searchTextFormField(){
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.black,)
        ),
      ),
    );
  }

  Widget _categoriesListView(){
    return Container(
      height: 150,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index){
          return Column(
            children: [
              Container(
                width: 85,
                height: 85,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade200,
                ),
                child: Image.asset("lib/assets/shoe.png"),
              ),
              SizedBox(height: 10),
              Text(list[index])
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return SizedBox(width: 25);
        },
      ),
    );
  }

  Widget _productsListView(){
    return Container(
      height: 350,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index){
          return Container(
            width: MediaQuery.of(context).size.width*0.4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                  child: Image.asset("lib/assets/iphone12.jpg", fit: BoxFit.fill)
                ),
                SizedBox(height: 5),
                CustomText(text: "iPhone 12"),
                SizedBox(height: 5),
                CustomText(text: "Apple Inc.", fontSize: 14, color: Colors.grey),
                SizedBox(height: 5),
                CustomText(text: "999\$", color: Colors.green),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return SizedBox(width: 20);
        },
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80, left: 20, right: 20),
          child:Column(
            children: [
              _searchTextFormField(),
              SizedBox(height: 30),
              CustomText(text: "Categories"),
              SizedBox(height: 30),
              _categoriesListView(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Best Selling", fontSize: 18),
                  CustomText(text: "See All", fontSize: 16)
                ],
              ),
              SizedBox(height: 30),
              _productsListView()
            ],
          ),
        ),
      )
    );
  }
}
