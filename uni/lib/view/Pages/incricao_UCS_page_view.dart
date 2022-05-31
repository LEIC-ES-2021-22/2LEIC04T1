import 'package:flutter/cupertino.dart';
import 'package:uni/controller/load_info.dart';
import 'package:uni/controller/exam.dart';
import 'package:uni/controller/mock_get_info.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:uni/view/Pages/pickup_page_view.dart';
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
import 'inscricao_ucs_add.dart';

int creditos_tot = 0;

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
    c.add(Text("Inscrição nas Unidades Curriculares", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));
    Course a = Course(459481,"Engenharia de Software","ESOF", "2020", 2021, "Active", ["João Pascoal Faria", "Ademar Aguiar"]);
      String regentt = "";
      for (int i = 0; i < a.regent_teachers.length; i++) {
        regentt += a.regent_teachers[i].toString() + "\n";
      }

       c.add(Container(

        width: 300,
        height: 130,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          //possible improvement: dinamically change cards height acording to its contents
            margin: EdgeInsets.zero,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
            color: Colors.grey,
            elevation: 10,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //leading: Icon(Icons.album, size: 60),
                  Text(a.name,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Text(a.currYear,
                      style: TextStyle(fontSize: 18.0, color: Colors.black45),
                      textAlign: TextAlign.left),
                  /*Text(a.credits,
                      style: TextStyle(fontSize: 18.0, color: Colors.black45),
                      textAlign: TextAlign.left),*/

                ],
              ),
            )),

       )
       );

    c.add(Text("Créditos totais: " + creditos_tot.toString(), style: TextStyle(color: Colors.black, fontSize: 16)));

    c.add(Container(




            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red)),
              child: const Text('+'),
              //Solução temporária
              onPressed: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Add_ucs()));

                /*final url =
                    "https://sigarra.up.pt/feup/pt/UCURR_GERAL.FICHA_UC_VIEW?pv_ocorrencia_id=" +
                        a.id.toString();
                if (await canLaunch(url)) {
                  await launch(url,
                      forceSafariVC: true,
                      forceWebView: true,
                      enableJavaScript: true);
                }*/
              }, //Use navigator to open new page with uc info
            )

    )

    );

    c.add(Container(




        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.green)),
          child: const Text('Concluir'),
          //Solução temporária
          onPressed: () async {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => PickupPageView()));

          }, //Use navigator to open new page with uc info
        )

    )
    );



    return ListView(children: <Widget>[Container(child: Column(mainAxisSize: MainAxisSize.max, children: c))]);
  }


}
