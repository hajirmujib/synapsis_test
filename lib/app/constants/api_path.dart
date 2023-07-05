class ApiConstants {
  static const apiKey = '1cd845ddd32b6519b9344802dfd7f942';
  static const baseUrl = 'https://tikit2-api.tripcetera.com';
  static const baseUrlImage = 'https://image.tmdb.org/t/p/w440_and_h660_face';

  static const login = '${baseUrl}/api/v1/login';
  static const supplierList =
      '${baseUrl}/api/v1/supplier?search=&IsCount=true&ItemPerPage=10&PageIndex=0';
  static const detailSupplier = '${baseUrl}/api/v1/supplier';
  static const addSupplier =
      '${baseUrl}/api/v1/supplier'; //POST, UPDATE, DELETE
  static const supplierListValue = '${baseUrl}/api/v1/supplier-listvalue';
}
