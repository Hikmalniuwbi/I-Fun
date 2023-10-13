import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_ecommerce/pages/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> showexitpopup(BuildContext context) async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(' Anda yakin ingin keluar?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('Yes'))
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: () async {
        bool exit = await showexitpopup(context);
        if (exit) {
          SystemNavigator.pop();
        }
        return exit;
      },
      child: Scaffold(
        body: Productpage(),
      ),
    );
  }
}
