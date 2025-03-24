## Requirements

- Ruby 3.0.0 or higher
- Rails 7.0.0 or higher
- SQLite
- OpenWeatherMap API key (free tier offers 1,000 API calls per day)

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/agbodike/weather.git
   cd weather
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. Set up your database:
   ```
   rails db:create
   rails db:migrate
   ```

4. Set up API credentials:
   - Sign up for a free API key at [OpenWeatherMap](https://openweathermap.org/api)
   - Create a `.env` file in the project root:
     ```
     OPENWEATHERMAP_API_KEY=your_api_key_here
     ```

## Starting the Application

1. Start the Rails server:
   ```
   bundle exec rails server
   ```

2. Access the application in your browser:
   ```
   http://localhost:3000/weather
   ```

## Running Tests

Run the tests:
```
bundle exec rspec
```

## API Access Requirements

### OpenWeatherMap API

This application uses the OpenWeatherMap API to retrieve weather data.

**Free Tier Limitations**:
- 1,000 API calls per day
- 60 calls per minute
- Limited weather data (current weather, basic forecasts)

**API Key Setup**:
1. Register at [OpenWeatherMap](https://home.openweathermap.org/users/sign_up)
2. After registration, go to your account's "API keys" tab
3. There may be an existing key, or you may need to generate one
4. Add this key to your `.env` file in `OPENWEATHERMAP_API_KEY`

**API Documentation**:
- [OpenWeatherMap API Documentation](https://openweathermap.org/api)

## Caching

The application implements a caching system to reduce API calls:

- Weather data is cached by zip code
- Cache expires after 30 minutes
- Visual indicator shows whether the results are from cache

## Notes:
### Caching Notes:
The current cache implementation uses local sqlite3 database. For a multi-server
system I would transition this to postgresql with a separate server to share the
cache across the web servers..

For a high load system, or a system that had more sophisticated caching
needs I would use Redis, or a similar robust caching system.

### Design Notes:
This implementation requires a zipcode be provided with the address. This is to
minimize the need for geolocation requests, and to simplify caching. The API
requires latitude and longitude when looking up weather, so to cache based on
zip code, the address must first be resolved to a latitude and longitude.

This can be done without the zipcode, but then an API request would always be
required to get the zipcode before checking the cache. Requiring the zipcode
allows the cache to be checked without resolving the address.

The downside to this is that if the user does not provide a zipcode during
lookup, the cache cannot be used. Currently it displays an error message to the
user if the zipcode isn't provided.

### TBD:
Make it more robust. Add more error messaging to help the user in the case of
errors. Handle API errors, such as timeouts or rejected connections.
