open Re

let startw = "!-- TS"
let endw = "TE"
let tickerSep = '|'

let extractFirstWord (word : string) (sep : char) =
  match String.index_opt word sep with
  | Some idx -> Some (String.sub word 0 idx)
  | None -> None

let extractFirstWordsFromLines (lines : string list) =
  List.filter_map (fun s -> extractFirstWord s tickerSep) lines

let extractBetween str1 word1 word2 =
  let pattern = compile (seq [ str word1; group (rep any); str word2 ]) in
  match exec_opt pattern str1 with
  | Some g -> Some (Group.get g 1)
  | None -> None

let extractTickersFromHtml (htmlBody : string) : string list =
  match extractBetween htmlBody startw endw with
  | Some res -> String.split_on_char '\n' res |> extractFirstWordsFromLines
  | None -> []
