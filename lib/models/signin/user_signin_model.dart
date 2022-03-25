class User {
  String? id;
  String? firstname;
  String? lastname;
  String? mobile;
  String? email;

  User({
    this.id,
    this.firstname,
    this.lastname,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        firstname = json["firstname"],
        email = json["email"],
        mobile = json["phone"],
        lastname = json["lastname"];
}
