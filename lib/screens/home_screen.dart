import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var fitur = ['Terlaris', 'Terdekat', 'Termurah', 'Jajanan', 'Profile'];
  var fiturIcons = [
    Icons.favorite_border_outlined,
    Icons.location_on_outlined,
    Icons.attach_money_outlined,
    Icons.fastfood_outlined,
    Icons.local_offer_outlined,
  ];
  var fiturRoutes = [
    '/list',
    '/nearest',
    '/cheapest',
    '/',
    '/profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back, ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffA4A8AE),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Shanon',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/promo.png'),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                itemCount: fitur.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, fiturRoutes[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              fiturIcons[index],
                              color: Colors.black,
                              size: 32,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Flexible(
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    fitur[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
