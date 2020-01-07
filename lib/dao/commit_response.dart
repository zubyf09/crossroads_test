

import 'package:crossroads_test/dao/commit_history.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'commit_response.g.dart';


@JsonSerializable()
class CommitResponse{

  List<CommitHistory> commitHistory;

  CommitResponse.fromJson(List<dynamic> json) {
    commitHistory = new List<CommitHistory>();
    json.forEach((v) {
      commitHistory.add(new CommitHistory.fromJson(v));}
    );

  }



}

