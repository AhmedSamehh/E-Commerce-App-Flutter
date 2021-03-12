import 'package:flutter/material.dart';

final String TABLE_CART_PRODUCTS = 'cartProducts';
final String COLUMN_ID = 'productId';
final String COLUMN_TITLE = 'title';
final String COLUMN_QUANTITY = 'quantity';
final String COLUMN_IMAGEURL = 'imageUrl';
final String COLUMN_PRICE = 'price';
final String CACHED_USER_DATA = 'CACHED_USER_DATA';
const primaryColor = Color.fromRGBO(0, 197, 105, 1);


const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum Delivery {
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery,
}