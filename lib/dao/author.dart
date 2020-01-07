import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';


@JsonSerializable()
class Author{

  String name;
  String date;
  String email;

  Author(this.name,this.date,this.email);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);




}