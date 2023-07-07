import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? accessToken;
  String? partnerToken;
  getSignInResponse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // accessToken = sharedPreferences.getString("access_token");
      accessToken = sharedPreferences.getString("access_token");
      partnerToken = sharedPreferences.getString("partner_token");
    });
  }

  @override
  void initState() {
    super.initState();
    getSignInResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(accessToken ?? ''),
            Text(partnerToken ?? ''),
          ],
        ),
      ),
    );
  }
}
