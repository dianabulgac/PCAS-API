Feature:City names
  Background:
    * url 'https://ws.footballpool.dataaccess.eu/info.wso'

  Scenario: get all city names

    Given  request
      """
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:foot="https://footballpool.dataaccess.eu">
       <soapenv:Header/>
       <soapenv:Body>
          <foot:Countries>
             <foot:sCountryName>Brazil</foot:sCountryName>
          </foot:Countries>
       </soapenv:Body>
    </soapenv:Envelope>
      """
    When soap action 'Countries'
    Then status 200
    And match /Envelope/Body/CountriesResponse/CountriesResult/tCountry/sName == 'Brazil'
    And print 'response: ', response
