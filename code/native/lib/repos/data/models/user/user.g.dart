// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      password: json['password'] as String,
      userID: json['userID'] as int,
      hasSubscription: json["hasSubscription"] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'userID': instance.userID,
      'hasSubscription': instance.hasSubscription,
    };
