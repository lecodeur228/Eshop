import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class Payement {
  final payGateUrl = "https://paygateglobal.com/api/v1/pay";

  Future givePayment() async {
     final  response = await http.post(Uri.parse(payGateUrl), body: {
      'auth_token': '967cb716-7205-457e-8032-26c73cdd5744',
      'phone_number': "70328015",
      "amount": "1",
      "identifier": "test1",
      "network": "TMONEY",
    });
    print("response status code : ${response.statusCode}");
    print("response body : ${response.body}");
  }
}
