/// data : {"id":"7b733d45-e0a8-4bb6-93cc-b5308e6188cb","email":"almasy@yopmail.com","firstName":"Dhruv","role":"Organizer","phone_number":"8320499968","age":null,"created_at":"2024-10-28 09:36:44","profession":null,"fb_url":"''","insta_url":"''","twitter_url":"''","profile_picture":"https://bga-api.3dlif.com/storage/user/profile_pictures/HxR1zRe6Wvm6frHBQUljzbhRjz4kXNnARcihWejF_cover_393_454.jpg","profile_picture_thumbnail":"https://bga-api.3dlif.com/storage/user/profile_pictures/HxR1zRe6Wvm6frHBQUljzbhRjz4kXNnARcihWejF_thumb_40_40.jpg"}
/// error : false
/// message : null

class ProfileModel {
  ProfileModel({
      Data? data,
      bool? error,
      dynamic message,}){
    _data = data!;
    _error = error!;
    _message = message;
}

  ProfileModel.fromJson(dynamic json) {
    _data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
    _error = json['error'];
    _message = json['message'];
  }
  Data? _data;
  bool? _error;
  dynamic _message;
ProfileModel copyWith({  Data? data,
  bool? error,
  dynamic message,
}) => ProfileModel(  data: data ?? _data,
  error: error ?? _error,
  message: message ?? _message,
);
  Data? get data => _data;
  bool? get error => _error;
  dynamic get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data!.toJson();
    }
    map['error'] = _error;
    map['message'] = _message;
    return map;
  }

}

/// id : "7b733d45-e0a8-4bb6-93cc-b5308e6188cb"
/// email : "almasy@yopmail.com"
/// firstName : "Dhruv"
/// role : "Organizer"
/// phone_number : "8320499968"
/// age : null
/// created_at : "2024-10-28 09:36:44"
/// profession : null
/// fb_url : "''"
/// insta_url : "''"
/// twitter_url : "''"
/// profile_picture : "https://bga-api.3dlif.com/storage/user/profile_pictures/HxR1zRe6Wvm6frHBQUljzbhRjz4kXNnARcihWejF_cover_393_454.jpg"
/// profile_picture_thumbnail : "https://bga-api.3dlif.com/storage/user/profile_pictures/HxR1zRe6Wvm6frHBQUljzbhRjz4kXNnARcihWejF_thumb_40_40.jpg"

class Data {
  Data({
      String? id,
      String? email,
      String? firstName,
      String? role,
      String? phoneNumber,
      dynamic age, 
      String? createdAt,
      dynamic profession, 
      String? fbUrl,
      String? instaUrl,
      String? twitterUrl,
      String? profilePicture,
      String? profilePictureThumbnail,}){
    _id = id!;
    _email = email!;
    _firstName = firstName!;
    _role = role!;
    _phoneNumber = phoneNumber!;
    _age = age;
    _createdAt = createdAt!;
    _profession = profession;
    _fbUrl = fbUrl!;
    _instaUrl = instaUrl!;
    _twitterUrl = twitterUrl!;
    _profilePicture = profilePicture!;
    _profilePictureThumbnail = profilePictureThumbnail!;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['firstName'];
    _role = json['role'];
    _phoneNumber = json['phone_number'];
    _age = json['age'];
    _createdAt = json['created_at'];
    _profession = json['profession'];
    _fbUrl = json['fb_url'];
    _instaUrl = json['insta_url'];
    _twitterUrl = json['twitter_url'];
    _profilePicture = json['profile_picture'];
    _profilePictureThumbnail = json['profile_picture_thumbnail'];
  }
  String? _id;
  String? _email;
  String? _firstName;
  String? _role;
  String? _phoneNumber;
  dynamic _age;
  String? _createdAt;
  dynamic _profession;
  String? _fbUrl;
  String? _instaUrl;
  String? _twitterUrl;
  String? _profilePicture;
  String? _profilePictureThumbnail;
Data copyWith({  String? id,
  String? email,
  String? firstName,
  String? role,
  String? phoneNumber,
  dynamic age,
  String? createdAt,
  dynamic profession,
  String? fbUrl,
  String? instaUrl,
  String? twitterUrl,
  String? profilePicture,
  String? profilePictureThumbnail,
}) => Data(  id: id ?? _id,
  email: email ?? _email,
  firstName: firstName ?? _firstName,
  role: role ?? _role,
  phoneNumber: phoneNumber ?? _phoneNumber,
  age: age ?? _age,
  createdAt: createdAt ?? _createdAt,
  profession: profession ?? _profession,
  fbUrl: fbUrl ?? _fbUrl,
  instaUrl: instaUrl ?? _instaUrl,
  twitterUrl: twitterUrl ?? _twitterUrl,
  profilePicture: profilePicture ?? _profilePicture,
  profilePictureThumbnail: profilePictureThumbnail ?? _profilePictureThumbnail,
);
  String? get id => _id;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get role => _role;
  String? get phoneNumber => _phoneNumber;
  dynamic get age => _age;
  String? get createdAt => _createdAt;
  dynamic get profession => _profession;
  String? get fbUrl => _fbUrl;
  String? get instaUrl => _instaUrl;
  String? get twitterUrl => _twitterUrl;
  String? get profilePicture => _profilePicture;
  String? get profilePictureThumbnail => _profilePictureThumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['firstName'] = _firstName;
    map['role'] = _role;
    map['phone_number'] = _phoneNumber;
    map['age'] = _age;
    map['created_at'] = _createdAt;
    map['profession'] = _profession;
    map['fb_url'] = _fbUrl;
    map['insta_url'] = _instaUrl;
    map['twitter_url'] = _twitterUrl;
    map['profile_picture'] = _profilePicture;
    map['profile_picture_thumbnail'] = _profilePictureThumbnail;
    return map;
  }

}