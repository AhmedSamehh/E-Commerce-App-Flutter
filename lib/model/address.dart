class Address {
  String street1;
  String street2;
  String city;
  String state;
  String country;

  Address({this.street1, this.street2, this.city, this.state, this.country});

  Address.fromJson(Map<dynamic, dynamic> map){
    if(map == null){
      return;
    }
    street1 = map['street1'];
    street2 = map['street2'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
  }

  toJson(){
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country
    };
  }
}