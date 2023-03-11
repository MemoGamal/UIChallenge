import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_challenge/Presentation/UI_Challenge/ui_viewModel.dart';
import 'package:ui_challenge/Presentation/constants/constants.dart';

class UI_Challenge extends StatefulWidget {
  const UI_Challenge({super.key});

  @override
  State<UI_Challenge> createState() => _UI_ChallengeState();
}

class _UI_ChallengeState extends State<UI_Challenge> {
  static final UIViewModel uiviewModel = UIViewModel();
  void bind() {
    uiviewModel.start();
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.white,
      body: StreamBuilder(
        stream: uiviewModel.Ui_ViewModeloutputs,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          } else {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.70,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Constants.borderRadius),
                  color: Colours.containerColour,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constants.headTitle,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Constants.subTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: snapshot.data,
                      )
                    ],
                  ),
                ),
                // child: Stack(
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width * 0.70,
                //       height: MediaQuery.of(context).size.height * 0.30,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius:
                //               BorderRadius.circular(Constants.borderRadius),
                //           color: Colours.containerColour,
                //         ),
                //         child: SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.60,
                //           height: MediaQuery.of(context).size.height * 0.15,
                //           child: snapshot.data,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
            );
          }
        },
      ),
    );
  }
}
