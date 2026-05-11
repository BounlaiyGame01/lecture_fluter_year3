import 'package:flutter/material.dart';

void showMyModalButtonSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 45, height: 5, color: Colors.grey),
            SizedBox(height: 20),

            Text(
              "ເລືອກລາຍການ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.blue, thickness: 2),
            ListTile(
              leading: Icon(
                Icons.groups_3_outlined,
                size: 30,
                color: Colors.grey,
              ),
              title: Text(
                "ຄຳແນະນຳ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.groups_3_outlined,
                size: 30,
                color: Colors.grey,
              ),
              title: Text(
                "ຄຳແນະນຳແຕ່ລະສາຂາ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
