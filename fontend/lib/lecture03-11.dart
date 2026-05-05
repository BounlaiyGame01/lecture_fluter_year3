import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "ລະບົບສັ່ງຈອງສິນຄ້າ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        color: Colors.amber,
        child: Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Spacer(),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Spacer(),
              Container(
                width: 100,
                height: 100,
                color: Colors.deepOrange,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Spacer(),
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}