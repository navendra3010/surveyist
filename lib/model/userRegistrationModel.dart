class UserRegistrationmodel

 {
 String? email;
 String? password;
 String? role;



 UserRegistrationmodel({this.email,this.password,this.role});
 //convert fireStore document to userModel

 factory UserRegistrationmodel.fromfirestore(Map<String,dynamic> json)
 {
  return UserRegistrationmodel(
    email:json['email'],
    password: json['password'],
    role:json['role'],

  );
  
 }
 //convert usermodel to josn fireStore 
 Map<String,dynamic>toJson()
 {
  return
  {
    "email":email,
    "password":password,
    "role":role,
  };
 }




 } 