class UserModel{
  String userId;
  String name;
  String email;
  String img;

  UserModel({this.userId, this.name, this.email, this.img});

  UserModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null ){
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    img = map['img'];
  }

  toJson(){
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'img': img
    };
  }
}