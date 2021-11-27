import 'package:tileswale/base/base.dart';
import 'package:tileswale/models/modesl.dart';

class API extends BaseAPI {
  @override
  String get baseURL => 'https://www.devops.tileswale.com/api/v26/';

  Future<CompanyResponse> getCompanies(Map<String, dynamic> data) async {
    final json = await post('company_list_by_category', data);

    return CompanyResponse.fromJson(json);
  }
}
