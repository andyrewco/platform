import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:local/repos/data/models/space/space.dart';

part 'interest.g.dart';

@JsonSerializable()
class Interest extends Equatable {
  final int interestID;
  final String name;
  final Space space;

  const Interest({
    required this.interestID,
    required this.name,
    required this.space,
  });

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);

  Map<String, dynamic> toJson() => _$InterestToJson(this);

  @override
  List<Object?> get props => [interestID, name, space];
}
