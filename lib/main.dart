import 'package:budget_mobile/home.dart';
import 'package:flutter/material.dart';
import 'navigation.dart';

// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Budget Mobile',
        home: NavigationWidget(
          children: <NavigationSectionWidget>[
            NavigationSectionWidget(
                icon: Icons.stars, title: 'Home', section: HomeWidget()),
            NavigationSectionWidget(
                icon: Icons.stop,
                title: 'Other',
                section: Text('Other Section')),
            NavigationSectionWidget(
                icon: Icons.pause,
                title: 'Other 2',
                section: Text('Other Section 2')),
            NavigationSectionWidget(
                icon: Icons.credit_card,
                title: 'Other 3',
                section: Text('Other Section 3')),
            NavigationSectionWidget(
                icon: Icons.portrait,
                title: 'Other 4',
                section: Text('Other Section 4')),
          ],
        ));
  }
}
