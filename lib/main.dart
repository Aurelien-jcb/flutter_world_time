import 'package:flutter/material.dart';
import 'package:flutter_world_time/pages/choose_location.dart';
import 'package:flutter_world_time/pages/home.dart';
import 'package:flutter_world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
        title: 'Flutter app',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const ChooseLocation(),
        }));
