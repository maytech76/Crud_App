import 'package:flutter/material.dart';
import 'package:producto_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:producto_app/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: authService.readToken(), // Cambio de String? a String
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Esperando...');
            }

            if (!snapshot.hasData || snapshot.data == '') {
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              });
            } else {
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
