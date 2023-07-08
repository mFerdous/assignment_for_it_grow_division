// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/resources/color_res.dart';
import '../../../dashboard/presentation/widget/dashboard.dart';
import '../../data/model/profile_info_response.dart';

class ProfileInfoScreen extends StatelessWidget {
  final ProfileInfoResponse response;
  const ProfileInfoScreen({
    Key? key,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile Data'),
        backgroundColor: ColorRes.kSecondaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Card(
          elevation: 4.0, // Sets the elevation (shadow) of the card
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    const Text('Name: '),
                    const Spacer(
                        // width: 5,
                        ),
                    Text(
                      response.name ?? '',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Text('Address: '),
                    const Spacer(
                        // width: 5,
                        ),
                    Text(
                      response.address ?? '',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
