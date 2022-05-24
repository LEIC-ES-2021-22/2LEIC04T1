import 'package:flutter/material.dart';
import 'package:uni/view/Pages/altera%C3%A7ao_UCS_page_view.dart';
import 'package:uni/view/Pages/incricao_UCS_page_view.dart';
import 'package:uni/view/Pages/incricao_turmas_UCS_page_view.dart';
import 'package:uni/view/Pages/show_UCS_schedule_page_view.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/main_cards_list.dart';

class PickupPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PickupPageViewState();
}

/// Tracks the state of pickup home page.
class PickupPageViewState extends GeneralPageViewState {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.red, //background color
        title: "PickUP",
        home: Scaffold(
        appBar: buildPickUPAppBar(context),
          body: Column(children: <Widget>[
            SizedBox(
              height: 30, // <-- SEE HERE
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
                      TextSpan(
                          text: "Up", style: new TextStyle(color: Colors.black))
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
/*        maxCrossAxisExtent: 120,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,*/
                children: actions
                    .map((action) => ActionButton(action: action))
                    .toList(),
              ),
            )
          ]),
        ));
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
    label: 'Alteração das Unidades Curriculares',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => alteracao_UCS()));
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
    label: 'Ver Horário',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => UrgentScreen()));
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
    return OutlinedButton(
        onPressed: () => action.callback?.call(context),
        style: OutlinedButton.styleFrom(
            backgroundColor: action.color,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            fixedSize: Size(300, 80)), //change buttons size
        //label: Text(action.label, style: TextStyle(color: action.labelColor)),
        child: Text(action.label,
            textAlign: TextAlign.center,
            style: TextStyle(color: action.labelColor, fontSize: 20)));
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: ('Products Page'),
      child: Center(
        child: Text('LIST OF PRODUCTS'),
      ),
    );
  }
}

class MailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'Mail Page',
      child: Center(
        child: Text('LIST OF MAIL'),
      ),
    );
  }
}

class UrgentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'Urgent Page',
      child: Center(
        child: Text('URGENT', style: TextStyle(color: Colors.redAccent)),
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'News Page',
      child: Center(
        child: Text('NEWS', style: TextStyle(color: Colors.green)),
      ),
    );
  }
}
