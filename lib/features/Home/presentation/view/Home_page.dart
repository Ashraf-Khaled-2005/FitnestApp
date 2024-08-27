import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/widget/buttom.dart';
import 'package:fitness_app/features/Auth/domain/model/userModel.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisesview.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'widget/home_body.dart';

class HomeView extends StatefulWidget {
  final bool isgoogle;
  const HomeView({super.key, this.isgoogle = false});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    if (widget.isgoogle) {
      context.read<GetuserdataCubit>().getuserdata();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Text(""),
        title: Text(
          "Welcome TO fitness App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () async {
                if (widget.isgoogle) {
                  final GoogleSignIn _googleSignIn = GoogleSignIn();
                  await _googleSignIn.signOut();
                } else {
                  await FirebaseAuth.instance.signOut();
                }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AuthStream()));
              },
              icon: Icon(
                Icons.logout,
                size: 24,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: HomeViewBody(),
      ),
      backgroundColor: Color(0xffFCFCFC),
    );
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double progress = 0;
  late InAppWebViewController _controller;

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "Best Offer",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.sizeOf(context).height * .5,
                width: double.infinity,
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        'https://app.vectary.com/p/18yp9b27pHcje8Ylefyj5L'),
                  ),
                  onWebViewCreated: (InAppWebViewController controler) {
                    _controller = controler;
                  },
                )),
            SizedBox(
              height: 20,
            ),
            customButtom(
              w: MediaQuery.sizeOf(context).width,
              ontap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId:
                        "AUEIqSIkKJ304-VnNrcnZ31ZcvsXPI-e_y3rt3oYHlJdhwIHmSZWcpCW9QjUDnADSejL1X6deqKMJiqJ",
                    secretKey:
                        "EJ1ZMqutPoVyrqaHDH8PIe3NJSmtTHb84KvtWPysA6UM963ma4dvOuRiaK7svu50be9idCbPogop9qI3",
                    transactions: const [
                      {
                        "amount": {
                          "total": '100',
                          "currency": "USD",
                          "details": {
                            "subtotal": '100',
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        "item_list": {
                          "items": [
                            {
                              "name": "Gym Equipment",
                              "quantity": 1,
                              "price": '100',
                              "currency": "USD"
                            },
                          ],
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      Navigator.pop(context);
                    },
                    onError: (error) {
                      log("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                      Navigator.pop(context);
                    },
                  ),
                ));
              },
              text: r"Pay $100",
            )
          ],
        ),
      ),
    );
  }
}
