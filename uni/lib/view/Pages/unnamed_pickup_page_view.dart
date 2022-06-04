import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'general_page_view.dart';

abstract class UnnamedPickUPPageView extends GeneralPageViewState {
  @override
  getScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: buildPickUPAppBar(context),
      body: this.refreshState(context, body),
    );
  }
}
