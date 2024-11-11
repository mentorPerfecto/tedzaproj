class UserResponseModel {
  UserResponseModel({
      this.id,
      this.email,
      this.password,
      this.name,
      this.role,
      this.avatar,});

  UserResponseModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }
  num? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
UserResponseModel copyWith({  num? id,
  String? email,
  String? password,
  String? name,
  String? role,
  String? avatar,
}) => UserResponseModel(  id: id ?? this.id,
  email: email ?? this.email,
  password: password ?? this.password,
  name: name ?? this.name,
  role: role ?? this.role,
  avatar: avatar ?? this.avatar,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['role'] = role;
    map['avatar'] = avatar;
    return map;
  }

}