import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/page_title.dart';

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
import 'package:uni/model/schedule_course_page_model.dart';

import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/Widgets/schedule_slot.dart';

/// Manages the 'schedule' sections of the app
class ScheduleCoursePageView extends StatelessWidget {

  ScheduleCoursePageView(
      {Key key,
        @required this.tabController,
        @required this.daysOfTheWeek,
        @required this.aggLectures,
        @required this.scheduleStatus,
        this.scrollViewController});

  final List<String> daysOfTheWeek;
  final List<List<Lecture>> aggLectures;
  final RequestStatus scheduleStatus;
  final TabController tabController;
  final ScrollController scrollViewController;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Horário'),
          TabBar(
            controller: tabController,
            isScrollable: true,
            tabs: createTabs(queryData, context),
          ),
        ],
      ),
      Expanded(
          child: TabBarView(
            controller: tabController,
            children: createSchedule(context),
          ))
    ]);
  }

  /// Returns a list of widgets empty with tabs for each day of the week.
  List<Widget> createTabs(queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];
    for (var i = 0; i < daysOfTheWeek.length; i++) {
      tabs.add(Container(
        color: Theme.of(context).backgroundColor,
        width: queryData.size.width * 1 / 3,
        child: Tab(key: Key('schedule-page-tab-$i'), text: daysOfTheWeek[i]),
      ));
    }
    return tabs;
  }

  List<Widget> createSchedule(context) {
    final List<Widget> tabBarViewContent = <Widget>[];
    for (int i = 0; i < daysOfTheWeek.length; i++) {
      tabBarViewContent.add(createScheduleByDay(context, i));
    }
    return tabBarViewContent;
  }

  /// Returns a list of widgets for the rows with a singular class info.
  List<Widget> createScheduleRows(lectures, BuildContext context) {
    final List<Widget> scheduleContent = <Widget>[];
    for (int i = 0; i < lectures.length; i++) {
      final Lecture lecture = lectures[i];
      scheduleContent.add(ScheduleSlot(
        subject: lecture.subject,
        typeClass: lecture.typeClass,
        rooms: lecture.room,
        begin: lecture.startTime,
        end: lecture.endTime,
        teacher: lecture.teacher,
        classNumber: lecture.classNumber,
      ));
    }
    return scheduleContent;
  }

  Widget Function(dynamic daycontent, BuildContext context) dayColumnBuilder(
      int day) {
    Widget createDayColumn(dayContent, BuildContext context) {
      return Container(
          key: Key('schedule-page-day-column-$day'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: createScheduleRows(dayContent, context),
          ));
    }

    return createDayColumn;
  }

  Widget createScheduleByDay(BuildContext context, int day) {
    return RequestDependentWidgetBuilder(
      context: context,
      status: scheduleStatus,
      contentGenerator: dayColumnBuilder(day),
      content: aggLectures[day],
      contentChecker: aggLectures[day].isNotEmpty,
      onNullContent:
      Center(child: Text('Não possui aulas à ' + daysOfTheWeek[day] + '.')),
      index: day,
    );
  }
}


/*
class ScheduleCourseViewState extends UnnamedPickUPPageView {

}
  @override
  Widget getBody(BuildContext context) {
    List<Widget> c = <Widget>[];
    c.add(Text("Unidades Curriculares atuais:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));
    return ListView(children: <Widget>[Container(child: Column(mainAxisSize: MainAxisSize.max, children: c))]);
  }

*/
