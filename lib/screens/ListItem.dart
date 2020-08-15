import 'package:flutter/material.dart';
import 'package:guist/models/Drug.dart';

class ListItem extends StatelessWidget {
  ListItem({this.data});
  final DrugList data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          key: Key(data.drugId),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  data.drugName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.green,
                label: Text(
                  "Available Qty. ${data.availableQty}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          children: <Widget>[
            Text(
              "Batch No.  ${data.drugId}" ?? "null",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "programmeId: ${data.programmeId}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "programmeName: ${data.programmeName}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Packing Description: ${data.packingDescription}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
        Divider(
          color: Colors.blue,
        )
      ],
    );
  }
}
