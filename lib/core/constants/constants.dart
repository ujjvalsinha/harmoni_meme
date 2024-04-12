class Constants {
  // This will also get from remote config or any backend souce for privcacy concerns
  static const apiKey = "uDXVU11YADyX4evsNC5K6k0AXhh7sZtH";
  static const memeBaseUrl = "https://api.giphy.com/v1/gifs/";
  static const trendingMemeUrl = "${memeBaseUrl}trending?api_key=$apiKey";
  static const memeSerchUrl = "${memeBaseUrl}search?api_key=$apiKey&q=";
}
