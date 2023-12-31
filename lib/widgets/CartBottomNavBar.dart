import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartBottomNavBar extends StatefulWidget {
  const CartBottomNavBar({super.key});

  @override
  State<CartBottomNavBar> createState() => _CartBottomNavBarState();
}

class _CartBottomNavBarState extends State<CartBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Total : ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                SizedBox(width: 15,),
                Text("Rp. 73.000", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.orange),),
              ],
            ),
            ElevatedButton(onPressed: () {},
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange), padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 20)), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            )),
            child: Text("Bayar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
}