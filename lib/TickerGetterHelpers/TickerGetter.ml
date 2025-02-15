open Loggers

let rec getTickersHelper (baseUrl : string)
  (urlBuilder : string -> int -> string) 
  (fetcher : string -> string)
  (htmlParser : string -> string list) 
  (currentIndex : int) (maxPageIndex : int)
  (acc : string list) 
  : string list =
  match currentIndex with
  | x when x >= maxPageIndex -> acc
  | y ->
    let res =
      baseUrl |> fun url -> urlBuilder url currentIndex |> fetcher |> htmlParser
    in
    let newIndex = y + 1 in
    let newAcc = acc @ res in
    getTickersHelper baseUrl urlBuilder fetcher htmlParser newIndex maxPageIndex
      newAcc

let get_tickers 
  (baseUrl : string) 
  (urlBuilder : string -> int -> string)
  (fetcher : string -> string) 
  (htmlParser : string -> string list)
  (maxPageIndex : int) : string list =
  Logger.log_info ("baseUrl: " ^ baseUrl);
  getTickersHelper baseUrl urlBuilder fetcher htmlParser 0 maxPageIndex []
