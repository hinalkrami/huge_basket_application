import 'package:hive_ce/hive.dart';
part 'address_model.g.dart';

@HiveType(typeId: 0)
class AddressModel extends HiveObject {
  AddressModel({required this.location, required this.unitNumber, required this.city, required this.state, required this.zipCode, required this.deliveryInstruction});
  @HiveField(0)
  late String location;
  @HiveField(1)
  late String unitNumber;
  @HiveField(2)
  late String city;
  @HiveField(3)
  late String state;
  @HiveField(4)
  late String zipCode;
  @HiveField(5)
  late String deliveryInstruction;
}
