import 'package:hive_ce/hive.dart';
import 'package:new_app/features/auth/data/model/user_details_model.dart';
import 'package:new_app/features/profile_page/data/manage_address_data_model/address_model.dart';

class HiveBox {
  Box<UserDetailsModel> userBox = Hive.box<UserDetailsModel>('userBox');
  Box<AddressModel> addressBox = Hive.box<AddressModel>('addressBox');
  void addLoginNumber(String phoneNumber) async {
    await userBox.add(UserDetailsModel(userNumber: phoneNumber));
  }

  void addUserDetails(
    String userNumber,
    String businessName,
    String emailAdd,
    String firstName,
    String lastName,
    String zipCode,
  ) async {
    await userBox.add(
      UserDetailsModel(
        userNumber: userNumber,
        businessName: businessName,
        emailAdd: emailAdd,
        firstName: firstName,
        lastName: lastName,
        zipCode: zipCode,
      ),
    );
  }

  void addAddressDetails(
    String location,
    String unitNumber,
    String city,
    String state,
    String zipCode,
    String deliveryInstruction,
  ) async {
    await addressBox.add(
      AddressModel(
        location: location,
        unitNumber: unitNumber,
        city: city,
        state: state,
        zipCode: zipCode,
        deliveryInstruction: deliveryInstruction,
      ),
    );
  }

  void updateAddressDetails(int index, AddressModel value) async {
    await addressBox.putAt(index, value);
  }
}
