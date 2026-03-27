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
  UserDetailsModel({this.userNumber, this.zipCode, this.businessName, this.emailAdd, this.firstName, this.lastName});
}
