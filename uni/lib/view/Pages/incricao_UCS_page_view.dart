import 'package:uni/controller/mock_get_info.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/pickup_page_view.dart';
import 'package:uni/view/Pages/unnamed_pickup_page_view.dart';
import '../../model/entities/course_unit.dart';
import 'inscricao_ucs_add.dart';

class incricao_UCS extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => incricao_UCSViewState();
}

/// Tracks the state of `Enrollment`.
class incricao_UCSViewState extends UnnamedPickUPPageView {
  List<CourseUnit> ucs_inscritas = get_enrolled_ucs();
  double creditos_tot = creditos_totais;
  Widget BuildCourse(BuildContext context, CourseUnit UC) {
    return Container(
        width: 400,
        height: 150,
        padding: EdgeInsets.all(12.0),
        child: Card(
            //possible improvement:
            // dinamically change cards height acording to its contents
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
                  Text(UC.name,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Text(UC.curricularYear.toString(),
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 18.0, color: Colors.black45),
                      textAlign: TextAlign.left),
                  Text("ECTS: " + UC.ects.toString(),
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 18.0, color: Colors.black45),
                      textAlign: TextAlign.left),
                ],
              ),
            )));
  }

  @override
  Widget getBody(BuildContext context) {
    List<Widget> c = <Widget>[];
    c.add(Text('Adicionar Unidades Curriculares',
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));

    for (CourseUnit uc in ucs_inscritas) {
      c.add(BuildCourse(context, uc));
    }

    if (creditos_tot > 30.0) {
      c.add(Text("Créditos totais: " + creditos_tot.toString(),
          style: TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)));
    } else {
      c.add(Text("Créditos totais: " + creditos_tot.toString(),
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)));
    }
    c.add(Container(
        padding: EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          child: const Text('+', style: TextStyle(fontSize: 24)),
          onPressed: () async {
            CourseUnit new_uc = await Navigator.push(
                context, MaterialPageRoute(builder: (_) => Add_ucs()));
            setState(() {
              ucs_inscritas = get_enrolled_ucs();
              creditos_tot = creditos_totais;
            });
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    'Increveste-te à unidade Curricular ${new_uc.name}',
                    textAlign: TextAlign.center,
                  )));
          },
        )));
    c.add(Container(
        child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
      child: const Text('Concluir', style: TextStyle(fontSize: 24)),
      onPressed: () async {
        creditos_totais = creditos_tot;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => PickupPageView()));
      },
    )));

    return ListView(children: <Widget>[
      Container(child: Column(mainAxisSize: MainAxisSize.max, children: c))
    ]);
  }
}
