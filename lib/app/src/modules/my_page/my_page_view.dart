import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/app/core/models/auth_model.dart';
import 'package:ttangkkeusmarket/app/core/widgets/custom_appbar.dart';
import 'package:ttangkkeusmarket/app/src/modules/cart/cart_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/login/login_view.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: '마이페이지',
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartView(),
                  ),
                ),
              },
              icon: const Icon(
                LineIcons.shoppingCart,
                size: 32.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          const ListTile(
            title: Text('환영합니다!'),
          ),
          ListTile(
            title: const Text('주문내역'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('고객센터'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('상품문의'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('대량주문 문의'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('자주하는질문'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('로그인'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginView()));
            },
          ),
          
          ListTile(
            title: const Text('로그아웃'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              authClient.logout();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(content: Text('logout!')));
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ]));
  }
}
