import 'package:flutter/cupertino.dart';
import 'package:uni/controller/load_info.dart';
import 'package:uni/controller/exam.dart';
import 'package:uni/controller/mock_get_info.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/unnamed_pickup_page_view.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/title_card.dart';

import 'dart:io';
import 'package:uni/model/entities/course.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';

//import '../../lib/controller/mock_get_info.dart';
import '../../model/entities/course.dart';

import 'package:uni/view/Widgets/account_info_card.dart';
import 'package:uni/view/Widgets/course_info_card.dart';
import 'package:uni/view/Widgets/print_info_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/entities/lecture.dart';
import '../Widgets/schedule_slot.dart';

class incricao_UCS extends StatefulWidget {
  //final List<Course> courses = get_courses();
  @override
  State<StatefulWidget> createState() =>
      incricao_UCSViewState(/*courses: courses*/);
}
/// Tracks the state of `Enrollment`.
class incricao_UCSViewState extends UnnamedPickUPPageView {
  final double borderRadius = 10.0;


  @override
  Widget getBody(BuildContext context) {
    List<Widget> c = <Widget>[];
    c.add(Text("Unidades Curriculares atuais:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));
    return ListView(children: <Widget>[Container(child: Column(mainAxisSize: MainAxisSize.max, children: c))]);
  }























}
