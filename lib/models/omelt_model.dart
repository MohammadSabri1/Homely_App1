
class homelyUsersModle{
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
   homelyUsersModle({
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
});
   homelyUsersModle.formJson(Map<String,dynamic>josn){
     email=josn['email'];
     firstName=josn['firstName'];
     lastName=josn['lastName'];
     phone=josn['phone'];
     street=josn['street'];
     cover=josn['cover'];
     city=josn['city'];
     password=josn['password'];
     gender=josn['gender'];
     date=josn['date'];

   }
   Map<String,dynamic>toMap()
   {
     return {
     'firstName':firstName,
     'lastName':lastName,
     'date':date,
     'email':email,
     'password':password,
     'phone':phone,
     'city':city,
     'cover':cover,
     'street':street,
     'gender':gender,
   };
   }
}