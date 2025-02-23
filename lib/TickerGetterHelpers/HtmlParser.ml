open Re
open Base
open Constants

let startw = Consts.startw
let endw = Consts.endw
let tickerSep = Consts.tickerSep

let extractFirstWord (word : string) (sep : char) : string option =
  match String.index word sep with
  | Some idx -> Some (String.sub word ~pos:0 ~len:idx)
  | None -> None

let%test_unit "extractFirstWordOne" =
  [%test_eq: string option] (extractFirstWord "abcd" 'c') (Some "ab")

let%test_unit "extractFirstWordMultiple" =
  [%test_eq: string option] (extractFirstWord "abcdcdcdc" 'c') (Some "ab")

let%test_unit "extractFirstWordDoesntExist" =
  [%test_eq: string option] (extractFirstWord "abcdcdcdc" 'f') None

let extractFirstWordsFromLines (lines : string list) : string list =
  List.filter_map ~f:(fun s -> extractFirstWord s tickerSep) lines

let%test_unit "extractFirstWordsFromLinesNormal" =
  [%test_eq: string list]
    (extractFirstWordsFromLines
       [ "smth|dsf"; "else|dsfd"; "Huh"; "entirely|again" ])
    [ "smth"; "else"; "entirely" ]

let extractBetween (str1 : string) (word1 : string) (word2 : string) :
  string option =
  let pattern = compile (seq [ str word1; group (rep any); str word2 ]) in
  match exec_opt pattern str1 with
  | Some g -> Some (Group.get g 1)
  | None -> None

let%test_unit "extractBetweenNormal" =
  [%test_eq: string option] (extractBetween "abcdc" "ab" "dc") (Some "c")

let%test_unit "extractBetweenDoesntExist" =
  [%test_eq: string option] (extractBetween "abcdd" "ab" "dc") None

let extractTickersFromHtml (htmlBody : string) : string list =
  match extractBetween htmlBody startw endw with
  | Some res ->
    String.split_on_chars ~on:[ '\n' ] res |> extractFirstWordsFromLines
  | None -> []
