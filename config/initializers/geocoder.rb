Geocoder.configure(
  timeout: 5,                # geocoding service timeout (secs)
  lookup: :nominatim,        # name of geocoding service (symbol)
  http_headers: { "User-Agent" => "YourAppName" }, # Required for Nominatim
  # use_https: true,         # use HTTPS for lookup requests? (if supported)
  # http_proxy: nil,         # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,        # HTTPS proxy server (user:pass@host:port)
  # api_key: nil,            # API key for geocoding service
  # cache: nil,              # cache object (must respond to #[], #[]=, and #del)
  # cache_prefix: 'geocoder:' # prefix (string) to use for all cache keys
)

