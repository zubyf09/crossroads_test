import 'package:crossroads_test/dao/committer.dart';
import 'package:json_annotation/json_annotation.dart';

import 'author.dart';

part 'commit.g.dart';


@JsonSerializable()
class Commit{

  String message;
  Author author;
  Committer committer;

  Commit(this.message,this.author,this.committer);

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);

  Map<String, dynamic> toJson() => _$CommitToJson(this);




}