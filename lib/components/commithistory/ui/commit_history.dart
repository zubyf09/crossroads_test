import 'package:crossroads_test/components/commithistory/bloc/bloc.dart';
import 'package:crossroads_test/dao/commit.dart';
import 'package:crossroads_test/utils/assets.dart';
import 'package:crossroads_test/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommitHistoryView extends StatefulWidget {
  @override
  _CommitHistoryViewState createState() => _CommitHistoryViewState();
}

class _CommitHistoryViewState extends State<CommitHistoryView> {
  CommitHistoryBloc historyBloc = CommitHistoryBloc();

  @override
  void initState() {
    super.initState();
    historyBloc.add(FetchCommitHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  BlocBuilder(
          bloc: historyBloc,
          builder: (BuildContext context, CommitHistoryState state) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: (state is CommitHistoryLoadedState)
                      ? Container(
                    child:
                    buildCommitHisotryList(state.commitHistory.commit),
                  )
                      : (state is CommitHistoryLoadingState)
                      ? Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage(Assets.imgBackground),
                              fit: BoxFit.cover,
                            )),
                        child: SpinKitWave(
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ))
                      : (state is CommitHistoryErrorState)
                      ? Center(
                    child:
                    Text("ERROR", style: Style.errorTextStyle),
                  )
                      : Container(),
                ),
              ],
            );
          }),
    );


  }

  Widget buildCommitHisotryList(List<Commit> commits) {
    return ListView.builder(
      itemCount: commits.length,
      itemBuilder: (BuildContext context, int index) {
        final commit = commits[index];

        return Column(
          children: <Widget>[
            Container(
              child: Text(commit.message, style: Style.errorTextStyle),
            ),
            Divider(
              color: Colors.white54,
            )
          ],
        );
      },
    );
  }
}
