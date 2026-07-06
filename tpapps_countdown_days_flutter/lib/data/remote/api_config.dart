/// Backend endpoint configuration. Swap [baseUrl] per environment.
class ApiConfig {
  const ApiConfig({this.baseUrl = 'https://api.countdown.example.com'});
  final String baseUrl;
}
