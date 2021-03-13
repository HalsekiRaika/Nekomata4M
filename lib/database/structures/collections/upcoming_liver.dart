import 'package:json_annotation/json_annotation.dart';

part 'upcoming_liver.g.dart';

@JsonSerializable()
class UpcomingLiver {
  final List<String> collect;

  UpcomingLiver({this.collect});

  factory UpcomingLiver.fromJson(Map<String, dynamic> json)
  => _$UpcomingLiverFromJson(json);
}