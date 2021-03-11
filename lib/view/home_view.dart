import 'package:ECommerce/core/view_model/control_view_model.dart';
import 'package:ECommerce/core/view_model/home_view_model.dart';
import 'package:ECommerce/view/product_details_view.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  Widget _searchTextFormField(){
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search Products..",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black,)
        ),
      ),
    );
  }

  Widget _categoriesListView(){
    return GetBuilder<HomeViewModel>(
      // init: HomeViewModel(),
      builder: (controller) => Container(
        height: 150,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, i){
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
                  child: Image.network(controller.categories[i].imageUrl),
                ),
                SizedBox(height: 10),
                Text(controller.categories[i].name)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(width: 25);
          },
        ),
      ),
    );
  }

  Widget _productsListView(){
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Get.to(ProductDetailsView(product: controller.products[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                      child: Image.network(controller.products[index].imageUrl, fit: BoxFit.fill)
                    ),
                    SizedBox(height: 5),
                    CustomText(text: controller.products[index].title),
                    SizedBox(height: 5),
                    CustomText(
                      text: controller.products[index].desc,
                      fontSize: 14,
                      color: Colors.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5),
                    CustomText(text: controller.products[index].price+" EGP", color: Colors.green),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(width: 20);
          },
        ),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) =>
      Scaffold(
        body: controller.loading.value?
        Center(child: CircularProgressIndicator())
        :SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
      ),
    );
  }
}
