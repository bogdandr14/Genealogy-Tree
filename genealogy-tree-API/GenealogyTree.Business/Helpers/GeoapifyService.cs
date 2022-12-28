using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Helpers
{
    public class GeoapifyService : IGeoService
    {
        private HttpClient _geoapifyClient;
        private readonly string _apiKey;
        private readonly string _baseAddress;
        private readonly string _searchFormat = "{0}/search?text={1}&type=city&format=json&apiKey={2}";

        public GeoapifyService(IConfiguration configuration)
        {
            _geoapifyClient = new HttpClient();
            IConfigurationSection geoApiConfiguration = configuration.GetSection("GeoApi");
            _apiKey = geoApiConfiguration.GetSection("ApiKey").Value;
            _baseAddress = geoApiConfiguration.GetSection("Url").Value;
        }

        public async Task<Coordinates> GetCoordinatesAsync(string state, string country, string city)
        {

            if (string.IsNullOrEmpty(city) || string.IsNullOrEmpty(state))
            {
                return null;
            }
            string locationRequested = city + ",";

            if (!string.IsNullOrEmpty(country))
            {
                locationRequested = string.Concat(locationRequested, country + ",");
            }

            locationRequested = string.Concat(locationRequested, state);//.Replace(" ", "%20").Replace(",", "%2C%20");

            string requestUri = string.Format(_searchFormat, _baseAddress, locationRequested, _apiKey);
            HttpResponseMessage httpResponseMessage = await _geoapifyClient.GetAsync(requestUri);

            if (httpResponseMessage.IsSuccessStatusCode)
            {
                string responseString = await httpResponseMessage.Content.ReadAsStringAsync();
                dynamic dynamicResponse = JsonConvert.DeserializeObject<dynamic>(responseString);
                dynamic firstFind = Enumerable.FirstOrDefault(dynamicResponse.results);

                if (firstFind != null && firstFind.lon != null && firstFind.lat != null)
                {
                    return new Coordinates()
                    {
                        Latitude = (float)(firstFind.lat),
                        Longitude = (float)(firstFind.lon)
                    };
                }
            }

            return null;
        }
    }
}
