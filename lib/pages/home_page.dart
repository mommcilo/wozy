import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Home'),
            ),
            child: const Center(child: Text('Welcome back!')),
          )
        : Scaffold(
            appBar: AppBar(title: const Text('Home')),
            body: const Center(child: Text('Welcome back!')),
          );
  }
}