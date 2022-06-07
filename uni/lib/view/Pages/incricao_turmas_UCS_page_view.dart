import 'package:flutter/cupertino.dart';
import 'package:uni/controller/mock_get_info.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/unnamed_pickup_page_view.dart';

class incricao_turmas_UCS extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => incricao_turmas_UCSViewState();
}

class incricao_turma_cadeira extends State<incricao_turmas_UCS> {
  incricao_turma_cadeira({@required CourseUnit this.uc,@required bool this.checkfirst});

  CourseUnit uc;
  bool checkfirst;

  Widget Build_Course_card_button(BuildContext context) {
    String turma = get_turma_uc(uc);
    List<String> turmas = get_turmas_uc(uc);

    Key key_uc_first_escolher_turmas, key_turma_inscrever_1st_uc;
    if(checkfirst){
      key_uc_first_escolher_turmas = Key("escolher_turma_1st_uc");
      key_turma_inscrever_1st_uc = Key("inscrever_turma_1st_uc");
    }

    return Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          key: key_uc_first_escolher_turmas,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            child: const Text('Escolher Turma'),
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text('Turmas:'),
                          content: Container(
                            width: double.minPositive,
                            height: 300,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: turmas.length,
                              itemBuilder: (BuildContext context, int index) {
                                String _key = turmas.elementAt(index);
                                return ListTile(
                                    title: Text(_key),
                                    leading: Radio<String>(
                                      key: Key(_key),
                                        groupValue: turma,
                                        value: _key,
                                        onChanged: (val) {
                                          setState(() {
                                            turma = val;
                                          });
                                        }));
                              },
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, null);
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              key: key_turma_inscrever_1st_uc,
                              onPressed: () {
                                set_turma_uc(uc, turma);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => incricao_turmas_UCS()));
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                          'Inscreveste-te na turma ${turma} para ${uc.name}',
                                          textAlign: TextAlign.center)));
                              },
                              child: Text('Inscrever'),
                            ),
                          ],
                        );
                      },
                    );
                  });
            } //Use navigator to open new page with uc info
            ));

  }

  @override
  Widget build(BuildContext context) {

    Key key_1st_uc_card;
    if(checkfirst && get_turma_uc(uc) == "2LEIC02"){
      key_1st_uc_card = Key("1st_uc_is_2LEIC02");
    }
    return Container(
      width: 300,
      height: 270,
      padding: new EdgeInsets.all(10.0),
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
                Text(uc.name,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text(uc.curricularYear.toString(),
                    style: TextStyle(fontSize: 18.0, color: Colors.black45),
                    textAlign: TextAlign.left),
                Build_Course_card_button(context),
                Text("\n" + "Turma : " + get_turma_uc(uc) + "\n",
                    key: key_1st_uc_card,
                    style: TextStyle(fontSize: 18.0, color: Colors.deepPurple),
                    textAlign: TextAlign.left),
              ],
            ),
          )),
    );
  }
}

/// Tracks the state of `Enrollment`.
class incricao_turmas_UCSViewState extends UnnamedPickUPPageView {
  List<CourseUnit> ucs = get_enrolled_ucs();

  @override
  Widget getBody(BuildContext context) {
    List<Widget> c = <Widget>[];
    c.add(Text("Unidades Curriculares atuais:",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));

    c.add(new incricao_turma_cadeira(uc: ucs[0], checkfirst: true).build(context));
    ucs.removeAt(0);
    for (CourseUnit uc in ucs) {
      c.add(new incricao_turma_cadeira(uc: uc, checkfirst: false).build(context));
    }
    return ListView(children: <Widget>[
      Container(key: Key("uc_cards"),child: Column(mainAxisSize: MainAxisSize.max, children: c))
    ]);
  }
}
