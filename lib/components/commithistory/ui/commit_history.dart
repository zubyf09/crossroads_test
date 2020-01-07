import 'package:crossroads_test/components/commithistory/bloc/bloc.dart';
import 'package:crossroads_test/dao/commit.dart';
import 'package:crossroads_test/dao/commit_history.dart';
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

      appBar: AppBar(
        centerTitle: true ,
          title: const Text('CrossRoad Test'),),

      body:  BlocBuilder(
          bloc: historyBloc,
          builder: (BuildContext context, CommitHistoryState state) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: (state is CommitHistoryLoadedState)
                      ? Container(
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new ExactAssetImage(Assets.imgBackground),
                          fit: BoxFit.cover,
                        )),
                    child:  Stack(children: <Widget>[

                      buildCommitHisotryList(state.commitResponse.commitHistory),

                      Container(alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 20,bottom: 20),
                       child: FloatingActionButton(
                         onPressed: (){
                           historyBloc.add(FetchCommitHistoryEvent());
                         },
                         child: Icon(Icons.refresh),
                       ),
                      )


                    ],),)
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
                    Text("Something went wrong", style: Style.errorTextStyle),
                  )
                      : Container(),
                ),
              ],
            );
          }),
    );
  }

  Widget buildCommitHisotryList(List<CommitHistory> commitsHistory) {
    return ListView.builder(
      itemCount: commitsHistory.length,
      itemBuilder: (BuildContext context, int index) {
        final commitHistory = commitsHistory[index];

        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(commitHistory.commit.author.name, style: Style.subtitleTextStyle),
            ),

            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(commitHistory.commit.message, style: Style.subtitleTextStyle),
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
