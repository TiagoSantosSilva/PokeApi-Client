# PokeApi Client

I created this simple app to learn how to use the Networking tools in Swift, alongside with some JSON interpreters.

### Networking 🌍
* URLSession
* [Alamofire](https://github.com/Alamofire/Alamofire/)
* [Moya](https://github.com/Moya/Moya)

### JSON Interpreters
* Dictionary Interpreter with `[String: Any]`
* JSONDecoder 
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

Running the app causes it to perform a request to the [PokéApi](https://pokeapi.co) `Berry Get By Id` endpoint. It then receives the JSON content and decodes it.

In total, 3 `GET` requests are performed: 1 with `URLSession`, 1 with`Alamofire` and 1 with `Moya`. Each content from the requests is then deserialized, using the above JSON Interpreters.
