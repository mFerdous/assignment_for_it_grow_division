import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import '../model/promo_campaign.dart';

Future<List<PromoCampaign>> fetchPromoCampaigns() async {
  final String url =
      'https://api-forexcopy.contentdatapro.com/Services/CabinetMicroService.svc';
  final String requestEnvelope = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
      "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n" +
      "  <soap:Body>\n" +
      "    <GetCCPromo xmlns=\"http://tempuri.org/\">\n" +
      "      <lang>en</lang>\n" +
      "    </GetCCPromo>\n" +
      "  </soap:Body>\n" +
      "</soap:Envelope>";
  // '<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">' +
  //     '<s:Body>' +
  //     '<GetCCPromo xmlns="http://tempuri.org/">' +
  //     '<lang>en</lang>' +
  //     '</GetCCPromo>' +
  //     '</s:Body>' +
  //     '</s:Envelope>';

  final response = await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'text/xml; charset=utf-8',
        "SOAPAction": "http://tempuri.org/CabinetMicroService/GetCCPromo"
      },
      body: requestEnvelope);

  final soapResponse = xml.XmlDocument.parse(response.body);
  final List<PromoCampaign> campaigns = [];

  for (var element in soapResponse.findAllElements('Promo')) {
    final title = element.findElements('Title').first.value;
    final imageUrl = element.findElements('ImageUrl').first.value;
    final hyperlink = element.findElements('Hyperlink').first.value;
    print(imageUrl);
    campaigns.add(PromoCampaign(
        title: title ?? '',
        imageUrl: imageUrl ?? '',
        hyperlink: hyperlink ?? ''));
  }

  return campaigns;
}
