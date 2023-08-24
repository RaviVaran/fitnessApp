import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/exercise_com_widget.dart';
import '/components/input_reps_com_widget.dart';
import '/components/input_weight_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartWorkoutModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController = StopWatchTimer(mode: StopWatchMode.countUp);

  // Models for inputWeight dynamic component.
  late FlutterFlowDynamicModels<InputWeightModel> inputWeightModels;
  // Models for inputRepsCom dynamic component.
  late FlutterFlowDynamicModels<InputRepsComModel> inputRepsComModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputWeightModels = FlutterFlowDynamicModels(() => InputWeightModel());
    inputRepsComModels = FlutterFlowDynamicModels(() => InputRepsComModel());
  }

  void dispose() {
    textController?.dispose();
    timerController.dispose();
    inputWeightModels.dispose();
    inputRepsComModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
