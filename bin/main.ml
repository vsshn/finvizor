open Fetchers
open Constants

let _baseUrl = Consts.baseUrl ^ "?t="
let _testTickers = ["AAP"]

let () =
  let url = "https://finviz.com/quote.ashx?t=" in
  let data = Fetcher.fetch_data url in
  Printf.printf "Fetched data: %s\n" data