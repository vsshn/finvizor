open TickerGetterHelpers
open Fetchers

let maxPageIndex = 490
let baseUrl = "https://finviz.com/screener.ashx?v=111"

let () =
  let result =
    TickerGetter.get_tickers baseUrl UrlGenerator.generateUrl Fetcher.fetch_data
      HtmlParser.extractTickersFromHtml maxPageIndex
  in
  List.iter print_endline result
