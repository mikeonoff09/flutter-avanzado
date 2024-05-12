import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../routes.dart';

class SplashView extends HookWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // the useEffect hook works as an initState function
    // it executes the effect function on every build or when the keys change
    useEffect(
      // this is the effect function
      () {
        Future<void> init() async {
          await Future.delayed(
            const Duration(seconds: 1),
          );
          if (context.mounted) {
            Navigator.pushReplacementNamed(
              context,
              Routes.home,
            );
          }
        }

        WidgetsBinding.instance.addPostFrameCallback(
          (_) => init(),
        );
        // the function in return executes on 
        return null;
      },
      // the useEffect hook will execute only once if it's the secound parameter
      // is set to [].
      // if we add keys the hook will execute again when the key value changes 
      // list of keys... [] => [key1, key2]
      [],
    );
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
