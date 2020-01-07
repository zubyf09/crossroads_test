import 'package:json_annotation/json_annotation.dart';

part 'committer.g.dart';

@JsonSerializable()
class Committer{

    String name;
    String date;
    String email;

    Committer(this.name,this.date,this.email);

    factory Committer.fromJson(Map<String, dynamic> json) => _$CommitterFromJson(json);

    Map<String, dynamic> toJson() => _$CommitterToJson(this);



}