import 'package:flutter/cupertino.dart';
import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/title_card.dart';

class EnrollmentsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EnrollmentPageViewState();
}

/// Tracks the state of `Enrollment`.
class EnrollmentPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  Widget getBody(BuildContext context) {
    return
      Center(
          child: Text("Inscrição",
              style:
          )
      );
  }
}
