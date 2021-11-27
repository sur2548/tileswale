class Company {
  late String name;
  late String image;

  Company({
    required this.name,
    required this.image,
  });

  Company.fromJson(Map<String, dynamic> json) {
    name = json['company_name'];
    image = json['company_logo'];
  }
}

class CompanyResponse {
  late List<Company> companies;

  CompanyResponse({required this.companies});

  CompanyResponse.fromJson(Map<String, dynamic> json) {
    companies = [];

    for(final el in json['results']['data']) {
      companies.add(Company.fromJson(el));
    }
  }
}
