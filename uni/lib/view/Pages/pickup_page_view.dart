import 'package:flutter/material.dart';
import 'package:uni/view/Pages/altera%C3%A7ao_UCS_page_view.dart';
import 'package:uni/view/Pages/incricao_UCS_page_view.dart';
import 'package:uni/view/Pages/incricao_turmas_UCS_page_view.dart';
import 'package:uni/view/Pages/show_UCS_schedule_page_view.dart';
import 'package:uni/view/Pages/unnamed_pickup_page_view.dart';
import 'package:uni/model/schedule_pickup_page_model.dart';

class PickupPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PickupPageViewState();
}

/// Tracks the state of pickup home page.
class PickupPageViewState extends UnnamedPickUPPageView {
  @override
  Widget getBody(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 30,
      ),
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: new TextStyle(
                  fontSize: 36.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(text: "Pick"),
                TextSpan(text: "Up", style: new TextStyle(color: Colors.black))
              ])), // Título página principal
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(30.0),
        alignment: Alignment.topCenter,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 30,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children:
              actions.map((action) => ActionButton(action: action)).toList(),
        ),
      )
    ]);
  }
}

final List<AppAction> actions = [
  AppAction(
    color: Colors.redAccent,
    label: 'Ver Horário das Unidades Curriculares',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => show_UCS_schedule()));
    },
  ),
  AppAction(
    color: Colors.redAccent,
    label: 'Inscrição nas Unidades Curriculares',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => incricao_UCS()));
    },
  ),
  AppAction(
    color: Colors.redAccent,
    label: 'Inscrição nas Turmas',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => incricao_turmas_UCS()));
    },
  ),
  AppAction(
    color: Colors.redAccent,
    label: 'Alteração das Unidades Curriculares',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => alteracao_UCS()));
    },
  ),
  AppAction(
    color: Colors.redAccent,
    label: 'Ver Horário',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SchedulePickUPPage()));
    },
  ),
];

class AppAction {
  final Color color;
  final String label;
  final Color labelColor;
  final void Function(BuildContext) callback;

  AppAction({
    this.color = Colors.blueGrey,
    this.label,
    this.labelColor = Colors.white,
    this.callback,
  });
}

class AppLayout extends StatelessWidget {
  final String pageTitle;
  final Widget child;

  const AppLayout({Key key, this.pageTitle, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: child,
    );
  }
}

class ActionButton extends StatelessWidget {
  final AppAction action;

  const ActionButton({
    Key key,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Key key_button;
    if (action.label == "Ver Horário das Unidades Curriculares")
      key_button = Key("ver_horario_turma_pickup_button");
    else if (action.label == "Inscrição nas Unidades Curriculares")
      key_button = Key("inscricao_ucs_pickup_button");
    else if (action.label == "Ver Horário")
      key_button = Key("ver_horario_pickup_button");
    else if (action.label == "Ver Horário das Unidades Curriculares")
      key_button = Key("ver_horario_pickup_button");
    else if (action.label == "Alteração das Unidades Curriculares")
      key_button = Key("alteracao_ucs_pickup_button");

    return OutlinedButton(
        key: key_button,
        onPressed: () => action.callback?.call(context),
        style: OutlinedButton.styleFrom(
            backgroundColor: action.color,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            fixedSize: Size(300, 80)), //change buttons size
        child: Text(action.label,
            textAlign: TextAlign.center,
            style: TextStyle(color: action.labelColor, fontSize: 20)));
  }
}
