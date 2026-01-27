// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  address: Address.fromJson(json['address'] as Map<String, dynamic>),
  company: Company.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'address': instance.address,
  'company': instance.company,
};

Address _$AddressFromJson(Map<String, dynamic> json) =>
    Address(city: json['city'] as String, zipcode: json['zipcode'] as String);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'city': instance.city,
  'zipcode': instance.zipcode,
};

Company _$CompanyFromJson(Map<String, dynamic> json) =>
    Company(name: json['name'] as String);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'name': instance.name,
};
