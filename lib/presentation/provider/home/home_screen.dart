import 'package:flutter/material.dart';
import 'package:ipet/domain/model/user.dart';
import 'package:ipet/domain/repository/api_repository.dart';
import 'package:ipet/domain/repository/local_storage_repository.dart';
import 'package:ipet/presentation/common/theme.dart';
import 'package:ipet/presentation/provider/home/cart/cart_bloc.dart';
import 'package:ipet/presentation/provider/home/cart/cart_screen.dart';
import 'package:ipet/presentation/provider/home/home_bloc.dart';
import 'package:ipet/presentation/provider/home/products/products_screen.dart';
import 'package:ipet/presentation/provider/home/profile/profile_screen.dart';
import 'package:ipet/presentation/provider/rappi/main_rappi_concept_app.dart';
import 'package:ipet/utils/hide_btn_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen._();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeBLoC(
            apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
            localRepositoryInterface: context.read<LocalRepositoryInterface>(),
          )..loadUser(),
          builder: (_, __) => HomeScreen._(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    return Scaffold(
      extendBody: true,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Expanded(
              child: IndexedStack(
                index: bloc.indexSelected,
                children: [
                  ProductsScreen.init(context),
                  MainRappiConceptApp(),
                  const CartScreen(),
                  const Placeholder(),
                  ProfileScreen.init(context),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: constraints.maxHeight * 0.11,
                child: _DeliveryNavigationBar(
                  index: bloc.indexSelected,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;

  _DeliveryNavigationBar({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    final cartBloc = Provider.of<CartBLoC>(context);
    final HideBottomNavbar hideNavbar = HideBottomNavbar();
    final user = bloc.user;
    TabController _tabController;

    return ValueListenableBuilder(
        valueListenable: hideNavbar.visible,
        builder: (context, bool value, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                border: Border.all(
                  color: Theme.of(context).bottomAppBarColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: BottomNavBar(
                index: index,
                bloc: bloc,
                cartBloc: cartBloc,
                user: user,
                tabController: _tabController,
              ),
            ),
          );
        });
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required this.index,
    @required this.bloc,
    @required this.cartBloc,
    @required this.user,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final int index;
  final HomeBLoC bloc;
  final CartBLoC cartBloc;
  final User user;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Material(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => bloc.updateIndexSelected(0),
              ),
            ),
          ),
          Expanded(
            child: Material(
              child: IconButton(
                icon: Icon(
                  Icons.store,
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => bloc.updateIndexSelected(1),
              ),
            ),
          ),
          Expanded(
            child: Material(
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: DeliveryColors.blackBlue,
                      radius: 23,
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_basket,
                          color: index == 2
                              ? DeliveryColors.green
                              : DeliveryColors.white,
                        ),
                        onPressed: () => bloc.updateIndexSelected(2),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: cartBloc.totalItems == 0
                          ? const SizedBox.shrink()
                          : CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.pinkAccent,
                              child: Text(
                                cartBloc.totalItems.toString(),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => bloc.updateIndexSelected(3),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => bloc.updateIndexSelected(4),
              child: user?.image == null
                  ? const SizedBox.shrink()
                  : Center(
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(
                          user.image,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
