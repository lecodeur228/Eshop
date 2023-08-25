import 'package:ecommerce/models/Payement.dart';
import 'package:ecommerce/widgets/textWidget.dart';
import 'package:ecommerce/widgets/topContainerWidget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(this.items, {super.key});
  final Map items;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final heigth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TopContainerWidget(
                  0, 0, width, heigth / 3, Colors.white, widget.items["image"]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                  widget.items["title"], Colors.black, 15, FontWeight.bold, 3),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget("Categories : ${widget.items["title"]}",
                  Colors.black, 13, FontWeight.bold, 3),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(widget.items["description"], Colors.black, 14,
                  FontWeight.normal, 10),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: 'Prix : ',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${widget.items["price"]} cfa',
                        style: TextStyle(color: Colors.redAccent)),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
              onPressed: () {
                Payement().givePayment();
              },
              child: TextWidget(
                  "A C H E T E R ", Colors.white, 15, FontWeight.w500, 1),
            )
          ],
        ),
      ),
    );
  }
}
