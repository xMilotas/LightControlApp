import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LightPanel extends StatelessWidget {
  final String localizedTitle;
  final String subTitle;
  final String id;

  const LightPanel(
      {Key? key,
      required this.localizedTitle,
      required this.id,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          height: 230,
          width: 180,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(360)),
                  border: Border.all(
                    color: Colors.purple.shade200,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: 
                    ClipOval(
                      child: TextButton(child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('img/$id.png'), fit: BoxFit.fill),
                      )), onPressed: () => sendRequest('1'), onLongPress: () => sendRequest('0'),
                      ),
                    ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 8),
              child:               Text(localizedTitle,
                  style: Theme.of(context).textTheme.subtitle1),
              ),

              Text(
                subTitle,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => sendRequest('1'),
                        icon: const Icon(Icons.lightbulb)),
                    IconButton(
                        onPressed: () => sendRequest('0'),
                        icon: const Icon(Icons.lightbulb_outline))
                  ]),
            ],
          )),
    );
  }

  Future<http.Response> sendRequest(String lightStatus) {
    return http.post(
      Uri.parse('http://192.168.0.63:8080/api/PowerPlugs'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'outletID': id,
        'outletStatus': lightStatus,
        'timer': 'false'
      }),
    );
  }
}
