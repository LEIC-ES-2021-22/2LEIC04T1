import 'package:flutter/material.dart';
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
    return AppLayout(
      pageTitle: 'Home Page',
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(30.0),
        child: GridView.extent(
          maxCrossAxisExtent: 120,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          children:
          actions.map((action) => ActionButton(action: action)).toList(),
        ),
      ),
    );
  }
}

final List<AppAction> actions = [
  AppAction(
    label: 'Inscrição nas Unidades Curriculares',
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ProductScreen()));
    },
  ),
  AppAction(
    label: 'Alteração das Unidades Curriculare',
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => MailScreen()));
    },
  ),
  AppAction(
    color: Colors.white,
    label: 'Inscrição nas Turmas',
    labelColor: Colors.redAccent,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => UrgentScreen()));
    },
  ),
  AppAction(
    color: Colors.green.shade200,
    label: 'Ver Horário',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => UrgentScreen()));
    },
  ),
  AppAction(
    color: Colors.green.shade200,
    label: 'Ver Horário das Unidades Curriculares',
    labelColor: Colors.black,
    callback: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => NewsScreen()));
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
    return
        OutlinedButton(

        onPressed: () => action.callback?.call(context),
        style: OutlinedButton.styleFrom(
          backgroundColor: action.color,
          padding: const EdgeInsets.all(16.0),
        ),
        //label: Text(action.label, style: TextStyle(color: action.labelColor)),
          child: Text(action.label, style: TextStyle(color: action.labelColor))
      );
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