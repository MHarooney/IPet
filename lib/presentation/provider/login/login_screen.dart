import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipet/constants/constants.dart';
import 'package:ipet/constants/ipet_dimens.dart';
import 'package:ipet/domain/repository/api_repository.dart';
import 'package:ipet/domain/repository/local_storage_repository.dart';
import 'package:ipet/presentation/common/custom_circle_raw_material_btn.dart';
import 'package:ipet/presentation/common/default_image.dart';
import 'package:ipet/presentation/common/delivery_button.dart';
import 'package:ipet/presentation/common/ipet_custom_icon.dart';
import 'package:ipet/presentation/common/label.dart';
import 'package:ipet/presentation/common/theme.dart';
import 'package:ipet/presentation/provider/home/home_screen.dart';
import 'package:ipet/presentation/provider/login/login_bloc.dart';
import 'package:provider/provider.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  LoginScreen._();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginBLoC(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => LoginScreen._(),
    );
  }

  void login(BuildContext context) async {
    final bloc = context.read<LoginBLoC>();
    final result = await bloc.login();
    if (result) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen.init(context),
        ),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Label(
            textColor: Colors.white,
            text: 'Login incorrect',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    final bloc = context.watch<LoginBLoC>();
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: constraints.maxHeight * 0.35,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: logoSize,
                        left: -moreSize / 2,
                        right: -moreSize / 2,
                        height: width + moreSize,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 1.0],
                              colors: deliveryGradients,
                            ),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(200),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).canvasColor,
                          radius: logoSize,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/ipet_paw_img.png',
                              // color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.34,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // const SizedBox(height: 30),
                          // Label(
                          //   text: 'Login',
                          //   txtStyle:
                          //       Theme.of(context).textTheme.headline6.copyWith(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //   textAlign: TextAlign.center,
                          // ),
                          Container(
                            height: constraints.maxHeight * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: IPetDimens.space20),
                                  child: Label(
                                    text: AppConst.kLoginTo,
                                    textColor:
                                        DeliveryColors.kTextRareGoldColor,
                                    fontWeight: FontWeight.bold,
                                    // size: IPetDimens.space20,
                                    size: constraints.maxWidth * 0.06,
                                  ),
                                ),
                                DefaultImage(
                                  image: AppConst.kIPetTxtImg,
                                  width: constraints.maxWidth * 0.3,
                                  // height:
                                  //     getProportionateScreenHeight(IPetDimens.space50),
                                  height: constraints.maxHeight * 0.05,
                                ),
                              ],
                            ),
                          ),
                          // const SizedBox(height: 40),
                          Label(
                            text: 'Username',
                            textAlign: TextAlign.start,
                            txtStyle:
                                Theme.of(context).textTheme.caption.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .labelStyle
                                          .color,
                                    ),
                          ),
                          TextField(
                            controller: bloc.usernameTextController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                hintText: 'username'),
                          ),
                          const SizedBox(height: 20),
                          Label(
                            text: 'Password',
                            txtStyle:
                                Theme.of(context).textTheme.caption.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .labelStyle
                                          .color,
                                    ),
                          ),
                          TextField(
                            controller: bloc.passwordTextController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                hintText: 'password'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IPetCustomCircleBtn(
                        constraintWidth: 50,
                        constraintHeight: 50,
                        iPetShapeBorder: CircleBorder(),
                        iPetChildCard: IPetCustomIcon(
                          ipFontIc: FontAwesomeIcons.google,
                          colour: Colors.white,
                        ),
                        iPetIconColor: Colors.white,
                        iPetFillColor: Colors.red,
                      ),
                      IPetCustomCircleBtn(
                        constraintWidth: 50,
                        constraintHeight: 50,
                        iPetShapeBorder: CircleBorder(),
                        iPetChildCard: IPetCustomIcon(
                          ipFontIc: FontAwesomeIcons.facebook,
                          colour: Colors.white,
                        ),
                        iPetIconColor: DeliveryColors.white,
                        iPetFillColor: DeliveryColors.blackBlue,
                      ),
                      if (Platform.isIOS)
                        IPetCustomCircleBtn(
                          constraintWidth: 50,
                          constraintHeight: 50,
                          iPetShapeBorder: CircleBorder(
                            side: BorderSide(
                              width: 2,
                              color: Colors.black,
                              style: BorderStyle.solid,
                            ),
                          ),
                          iPetChildCard: IPetCustomIcon(
                            ipFontIc: FontAwesomeIcons.apple,
                            colour: Colors.black,
                          ),
                          iPetIconColor: Colors.black,
                          iPetFillColor: Colors.white,
                        )
                    ],
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.12,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: DeliveryButton(
                      text: 'Login',
                      onTap: () => login(context),
                    ),
                  ),
                ),
              ],
            );
          }),
          Positioned.fill(
              child: (bloc.loginState == LoginState.loading)
                  ? Container(
                      color: Colors.black26,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
