class UserModel {
  final String userName;
  final String userImage;
  final String? userLocation;
  final String? userSchool;
  final String? userAge;
  final String? userPhoneNumber;
  final String? userNationalID;

  UserModel({
    required this.userName,
    required this.userImage,
    this.userAge,
    this.userLocation,
    this.userPhoneNumber,
    this.userSchool,
    this.userNationalID
  });
}
