import 'package:hive_ce/hive.dart';
part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel extends HiveObject {
  AddressModel({
    this.location,
    this.unitNumber,
    this.city,
    this.state,
    this.zipCode,
    this.deliveryInstruction,
  });
  @HiveField(0)
  late String? location;
  @HiveField(1)
  late String? unitNumber;
  @HiveField(2)
  late String? city;
  @HiveField(3)
  late String? state;
  @HiveField(4)
  late String? zipCode;
  @HiveField(5)
  late String? deliveryInstruction;
}
