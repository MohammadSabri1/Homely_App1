class homelyUsersModle {
  String? firstName;
  String? lastName;
  String? email;
  String? date;
  String? phone;
  String? gender;
  String? password;
  String? city;
  String? cover;
  String? street;
  String? uid;
  String? image;


  homelyUsersModle.homelyUsersModel({
    this.firstName,
    this.lastName,
    this.date,
    this.email,
    this.phone,
    this.street,
    this.city,
    this.cover,
    this.gender,
    this.password,
    this.image,
    this.uid,

  });

  factory homelyUsersModle.fromMap(Map<String, dynamic> map)  {
    return homelyUsersModle.homelyUsersModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phone: map['phone'],
      street: map['street'],
      cover: map['cover'],
      city: map['city'],
      password: map['password'],
      gender: map['gender'],
      date: map['date'],
      image: map['image'],
      uid: map['uid'],


    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'date': date,
      'email': email,
      'password': password,
      'phone': phone,
      'city': city,
      'cover': cover,
      'street': street,
      'gender': gender,
      'uid': uid,
      "image": image,

    };
  }
}



class SuggestionsAndComplaintsModel{

  String? SuggesAndComplain;
  SuggestionsAndComplaintsModel.SuggestionsAndComplaintsModel({
    this.SuggesAndComplain,
  });
  factory SuggestionsAndComplaintsModel.
  fromMap(Map<String, dynamic> map) {
    return SuggestionsAndComplaintsModel.SuggestionsAndComplaintsModel(
      SuggesAndComplain: map['SuggesAndComplain']
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'SuggesAndComplain':SuggesAndComplain
    };
    }
}