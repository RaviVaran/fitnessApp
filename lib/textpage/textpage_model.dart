import '/components/start_workout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextpageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for start_workout component.
  late StartWorkoutModel startWorkoutModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    startWorkoutModel = createModel(context, () => StartWorkoutModel());
  }

  void dispose() {
    unfocusNode.dispose();
    startWorkoutModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
