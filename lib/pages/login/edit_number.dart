import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_chat_app/pages/login/select_country.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({Key? key}) : super(key: key);

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  var enterPhoneNumber = TextEditingController();
  Map<String, dynamic> data = {'name': 'India', 'code': '+91'};
  Map<String, dynamic>? dataResult;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.yellow,
        middle: Text('Edit Number'),
        previousPageTitle: "Back",
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verification',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Gap(30),
          CupertinoListTile(
            onTap: () async {
              dataResult = await Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => SelectCountry()));
              setState(() {
                if (dataResult != null) data = dataResult!;
              });
            },
            title: Text(
              data['name'],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Gap(5),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    data['code'],
                    style: TextStyle(
                      fontSize: 25,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      placeholder: 'Enter your Number',
                      // controller: _enterPhoneNumber,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 25,
                        color: CupertinoColors.secondaryLabel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(30),
          Text(
            "You receive a OTP in short time",
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: CupertinoButton.filled(
              child: Text(
                'Submit',
              ),
              onPressed: (() {}),
            ),
          ),
        ],
      ),
    );
  }
}
