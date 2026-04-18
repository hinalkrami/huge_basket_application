// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailsModelAdapter extends TypeAdapter<UserDetailsModel> {
  @override
  final typeId = 0;

  @override
  UserDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsModel(
      userNumber: fields[0] as String?,
      businessName: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      emailAdd: fields[4] as String?,
      zipCode: fields[5] as String?,
      isLogin: fields[6] as bool?,
      country: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userNumber)
      ..writeByte(1)
      ..write(obj.businessName)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.emailAdd)
      ..writeByte(5)
      ..write(obj.zipCode)
      ..writeByte(6)
      ..write(obj.isLogin)
      ..writeByte(7)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
