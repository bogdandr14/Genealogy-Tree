using System;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ICachingService
    {
        /// <summary>
        /// Creates or overwrites the specified entry in the cache
        /// </summary>
        /// <typeparam name="T">The type of the value to set</typeparam>
        /// <param name="key">The entry to create or overwrite</param>
        /// <param name="value">The value or null</param>
        /// <returns></returns>
        /// <exception cref="ArgumentNullException"></exception>
        void SetObject<T>(string key, T value);

        /// <summary>
        /// Creates or overwrites the specified entry in the cache
        /// </summary>
        /// <typeparam name="T">The type of the value to set</typeparam>
        /// <param name="key">The entry to create or overwrite</param>
        /// <param name="value">The value or null</param>
        /// <param name="timeSpan">Optional lifetime timespan</param>
        /// <returns></returns>
        /// <exception cref="ArgumentNullException"></exception>
        void SetObject<T>(string key, T value, TimeSpan? timeSpan);

        /// <summary>
        /// Gets the item associated with this key if present
        /// </summary>        
        /// <param name="key">A string identifying the requested entry</param>        
        /// <returns>Cached object or null</returns>
        /// <exception cref="ArgumentNullException"></exception>
        T GetObject<T>(string key);

        /// <summary>
        /// Removes the value with the given key.
        /// </summary>
        /// <param name="key">A string identifying the entry</param>
        public void Remove(string key);

        /// <summary>
        /// Return a value whether or not a cache entry exists for the given key
        /// </summary>
        /// <param name="key"></param>
        /// <returns>True or false</returns>
        public bool IsObjectCached(string key);
    }
}
