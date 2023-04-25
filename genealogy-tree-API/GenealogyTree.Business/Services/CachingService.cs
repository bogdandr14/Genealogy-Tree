using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;

namespace GenealogyTree.Business.Services
{
    public class CachingService : ICachingService
    {
        private IMemoryCache _cache;
        private readonly TimeSpan? _absoluteExpirationRelative;
        private bool _shouldBypassCache;

        public CachingService(IMemoryCache cache, IConfiguration configuration)

        {
            _cache = cache;

            if (configuration.GetSection("MemoryCache").Exists())
            {
                IConfigurationSection memoryCacheConfiguration = configuration.GetSection("MemoryCache");

                bool.TryParse(memoryCacheConfiguration.GetSection("BypassCache").Value, out _shouldBypassCache);
                
                if (TimeSpan.TryParse(memoryCacheConfiguration.GetSection("AbsoluteExpirationRelative").Value, out TimeSpan absoluteExpiration))
                {
                    _absoluteExpirationRelative = absoluteExpiration;
                }
            }
        }

        public void SetObject<T>(string key, T value)
        {
            SetObject(key, value, null);
        }

        public void SetObject<T>(string key, T value, TimeSpan? timeSpan)
        {

            if (key == null)
            {
                throw new ArgumentNullException(nameof(key));
            }

            if (value == null)
            {
                throw new ArgumentNullException(nameof(value));
            }

            if (_cache.TryGetValue(key, out _))
            {
                _cache.Remove(key);
            }

            if (timeSpan.HasValue)
            {
                _cache.Set<T>(key, value, timeSpan.Value);
            }
            else if (_absoluteExpirationRelative.HasValue)
            {
                _cache.Set<T>(key, value, _absoluteExpirationRelative.Value);
            }
            else
            {
                _cache.Set<T>(key, value);
            }
        }

        public T GetObject<T>(string key)
        {
            if (key == null)
            {
                throw new ArgumentNullException(nameof(key));
            }

            if (_shouldBypassCache)
            {
                return default;
            }

            return _cache.Get<T>(key);
        }

        public void Remove(string key)
        {
            _cache.Remove(key);
        }

        public bool IsObjectCached(string key)
        {
            return !_shouldBypassCache && _cache.TryGetValue(key, out _);
        }
    }
}
