import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tileswale/base/base.dart';
import 'package:tileswale/models/modesl.dart';
import 'package:tileswale/screens/dashboard/grid_list.dart';
import 'package:tileswale/states/states.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Content<DashboardState>(
      onStateReady: (state) => state.init(context),
      create: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('DASHBOARD'),
          ),
          body: state.isBusy
              ? const Center(child: CircularProgressIndicator())
              : GridList(
                  itemCount: state.companies.length,
                  crossAxisCount: 4,
                  controller: state.scrollController,
                  itemBuilder: (_, int index) {
                    return _CompanyItem(item: state.companies[index]);
                  },
                ),
        );
      },
    );
  }
}

class _CompanyItem extends StatelessWidget {
  final Company item;

  const _CompanyItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Image.network(
            item.image,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          item.name,
          maxLines: 1,
        ),
      ],
    );
  }
}
