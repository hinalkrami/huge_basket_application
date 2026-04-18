import 'package:countrify/countrify.dart';
import 'package:hive_ce/hive.dart';
part 'user_details_model.g.dart';

@HiveType(typeId: 0)
class UserDetailsModel {
  @HiveField(0)
  String? userNumber;
  @HiveField(1)
  String? businessName;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? emailAdd;
  @HiveField(5)
  String? zipCode;
  @HiveField(6)
  bool? isLogin;
  @HiveField(7)
  String? country;

  UserDetailsModel({
    this.userNumber,
    this.businessName,
    this.firstName,
    this.lastName,
    this.emailAdd,
    this.zipCode,
    this.isLogin,
    this.country,
  });

  UserDetailsModel copyWith({
    String? userNumber,
    String? businessName,
    String? firstName,
    String? lastName,
    String? emailAdd,
    String? zipCode,
    bool? isLogin,
    bool? isDetailsFilled,
    String? country,
  }) => UserDetailsModel(
    userNumber: userNumber ?? this.userNumber,
    businessName: businessName ?? this.businessName,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    emailAdd: emailAdd ?? this.emailAdd,
    zipCode: zipCode ?? this.zipCode,
    isLogin: isLogin ?? this.isLogin,
    country: country ?? this.country,
  );
}
