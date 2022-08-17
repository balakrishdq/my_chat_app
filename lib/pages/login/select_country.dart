import 'dart:convert';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<dynamic>? dataRetrieved; //data to decode from the json file
  List<dynamic>? data; //data is to display in the screen
  var searchController = TextEditingController();
  var searchValue = "";
  Future _getData() async {
    final String response =
        await rootBundle.loadString('assets/CountryCodes.json');
    dataRetrieved = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrieved;
    });
    return 'success';
  }

  @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.yellow,
            largeTitle: Text('Select Country'),
            previousPageTitle: 'Edit Number',
          ),
          SliverToBoxAdapter(
            child: CupertinoSearchTextField(
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              controller: searchController,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              (data != null)
                  ? data!
                      .where(
                        (e) => e['name']
                            .toString()
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()),
                      )
                      .map(
                        (e) => CupertinoListTile(
                          onTap: () {
                            print(e['name']);
                            Navigator.pop(context,
                                {"name": e['name'], "code": e['dial_code']});
                          },
                          title: Text(e['name']),
                          trailing: Text(e['dial_code']),
                        ),
                      )
                      .toList()
                  : [
                      Center(
                        child: Text("Loading"),
                      ),
                    ],
            ),
          )
        ],
      ),
    );
  }
}
