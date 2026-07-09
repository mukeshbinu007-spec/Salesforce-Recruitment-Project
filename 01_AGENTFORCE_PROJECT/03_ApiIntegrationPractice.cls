public class ApiIntegrationPractice {
public static void callAPI() {
Http http = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('callout:WeatherAPI/data/2.5/weather?q=London&appid=868f48b17b76510b353ed71e8e7388fe');
req.setMethod('GET');
HttpResponse res = http.send(req);
if (res.getStatusCode() == 200) {
  String responseBody = res.getBody();
  WeatherWrapper w = (WeatherWrapper) JSON.deserialize(responseBody, WeatherWrapper.class);
    System.debug('City : '+ w.name);
    System.debug('Temperature: ' + w.main.temp);
    System.debug('Humidity : ' + w.main.humidity);
  }
}
    public class WeatherWrapper {
        public String name;
        public Main main;
    }

    public class Main {
        public Decimal temp;
        public Decimal humidity;
    }
}

