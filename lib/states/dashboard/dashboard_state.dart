import 'package:flutter/material.dart';
import 'package:tileswale/models/modesl.dart';
import 'package:tileswale/states/state.dart';

class DashboardState extends ViewModel {
  late BuildContext context;

  List<Company> companies = [];
  int page = 1;

  final scrollController = ScrollController();

  void init(BuildContext context) {
    this.context = context;
    scrollController.addListener(pagination);
    getData();
  }

  void getData() async {
    setBusy(true);
    final data = {
      'mode': 'listing',
      'page': page,
    };

    final response = await api.getCompanies(data);
    companies.addAll(response.companies);
    setBusy(false);
  }

  void pagination() {
    if ((scrollController.position.pixels ==
        scrollController.position.maxScrollExtent)) {
      page += 1;
      getData();
    }
  }
}
