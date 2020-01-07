

import 'package:json_annotation/json_annotation.dart';

import 'commit.dart';

part 'commit_history.g.dart';


@JsonSerializable()
class CommitHistory{

  Commit commit;
  CommitHistory(this.commit);

  factory CommitHistory.fromJson(Map<String, dynamic> json) => _$CommitHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$CommitHistoryToJson(this);

}

