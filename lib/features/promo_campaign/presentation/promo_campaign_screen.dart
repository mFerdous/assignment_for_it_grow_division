import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/resources/color_res.dart';
import '../../../core/utils/lang/app_localizations.dart';
import '../../common/presentation/widget/drawer.dart';
import '../data/model/promo_campaign.dart';
import '../data/remote/promo_campaign_remote.dart';

class PromoCampaignsScreen extends StatefulWidget {
  @override
  State<PromoCampaignsScreen> createState() => _PromoCampaignsScreenState();
}

class _PromoCampaignsScreenState extends State<PromoCampaignsScreen> {
  late Future<List<PromoCampaign>> _campaignsFuture;

  @override
  void initState() {
    super.initState();
    _campaignsFuture = fetchPromoCampaigns();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: DrawerWidgets(),
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context).translate('promo_campaign'),
              ),
              centerTitle: true,
              backgroundColor: ColorRes.kSecondaryColor,
            ),
      body: FutureBuilder<List<PromoCampaign>>(
        future: _campaignsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('No promotional campaigns available.'));
          } else {
            final campaigns = snapshot.data!;
            log(json.encode(campaigns));
            return ListView.separated(
              itemCount: campaigns.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final campaign = campaigns[index];

                return GestureDetector(
                  onTap: () {
                    // Handle the tap on the hyperlink here.
                    print('Clicked hyperlink: ${campaign.hyperlink}');
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(campaign.imageUrl),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(campaign.title),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
