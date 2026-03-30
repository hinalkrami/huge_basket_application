import 'package:countrify/countrify.dart';
import 'package:hive_ce/hive.dart';
part 'user_details_model.g.dart';

@HiveType(typeId: 0)
class UserDetailsModel {
  @HiveField(0)
  late String? userNumber;
  @HiveField(1)
  late String? businessName;
  @HiveField(2)
  late String? firstName;
  @HiveField(3)
  late String? lastName;
  @HiveField(4)
  late String? emailAdd;
  @HiveField(5)
  late String? zipCode;
  @HiveField(6)
  late bool isLogin;
  @HiveField(7)
  late bool isDetailsFilled;
  @HiveField(8)
  late String? country;
  UserDetailsModel({
    this.userNumber,
    this.zipCode,
    this.businessName,
    this.emailAdd,
    this.firstName,
    this.lastName,
    this.isLogin = false,
    this.isDetailsFilled = false,
    this.country,
  });
}
