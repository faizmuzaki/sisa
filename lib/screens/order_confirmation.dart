import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisa/widgets/CartBottomNavBar.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pesanan")),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 9),
                      child: Container(
                        width: 380,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 10, offset: Offset(0, 3))]),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/pizza.png', height: 80, width: 150,),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pizza Jumbo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text('Varian baru', style: TextStyle(fontSize: 13, ),),
                                  Text('Rp. 45.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(10),),
                                child: Column(
                                  children: [
                                    Icon(CupertinoIcons.plus, color: Colors.white,),
                                    Text("1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                                    Icon(CupertinoIcons.minus, color: Colors.white,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 9),
                      child: Container(
                        width: 380,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 10, offset: Offset(0, 3))]),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/burger.png', height: 80, width: 150,),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Burger Jumbo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text('Varian baru', style: TextStyle(fontSize: 13, ),),
                                  Text('Rp. 20.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(10),),
                                child: Column(
                                  children: [
                                    Icon(CupertinoIcons.plus, color: Colors.white,),
                                    Text("1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                                    Icon(CupertinoIcons.minus, color: Colors.white,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 9),
                      child: Container(
                        width: 380,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 10, offset: Offset(0, 3))]),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/drink.png', height: 80, width: 150,),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Soda Dingin', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text('Banyak variasinya', style: TextStyle(fontSize: 13, ),),
                                  Text('Rp. 8.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(10),),
                                child: Column(
                                  children: [
                                    Icon(CupertinoIcons.plus, color: Colors.white,),
                                    Text("1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                                    Icon(CupertinoIcons.minus, color: Colors.white,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 10, offset: Offset(0, 3))]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Items : ", style: TextStyle(fontSize: 20),),
                                  Text("3", style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ),

                            Divider(
                              color: Colors.black,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sub-total : ", style: TextStyle(fontSize: 20),),
                                  Text("Rp. 73.000", style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Biaya platform : ", style: TextStyle(fontSize: 20),),
                                  Text("Rp. 3000", style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  Text("Rp. 76.000", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )

                ],
              ),
            ),
          )
        ],
      ),

      drawer: Drawer(),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}