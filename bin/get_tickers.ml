open TickerGetterHelpers
open Fetchers
open Loggers

let maxPageIndex = 500
let baseUrl = "https://finviz.com/screener.ashx?v=111"

let () =
  Logger.log_info(baseUrl);
  let result =
    TickerGetter.get_tickers baseUrl UrlGenerator.generateUrl Fetcher.fetch_data
      HtmlParser.extractTickersFromHtml maxPageIndex
  in
  List.iter print_endline result
