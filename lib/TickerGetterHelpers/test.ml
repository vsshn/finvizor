open OUnit2
open TickerGetterHelpers
open Constants

(* 
Tests for UrlGenerator
    *)
let testUrlGeneratorNormal _ =
  assert_equal "base&r=21" (UrlGenerator.generateUrl "base" 1);
  assert_equal "base&r=401" (UrlGenerator.generateUrl "base" 20)

let testUrlGeneratorRaises _ =
  assert_raises (Invalid_argument "Page number cannot be negative") (fun () ->
    UrlGenerator.generateUrl "base" (-20))

(* 
Tests for HtmlParser 
   *)

let testExtractTickersFromHtmlNormal _ =
  assert_equal (HtmlParser.extractTickersFromHtml
    ("blahblahblah" ^ Consts.startw ^ "Abc|sdljdk\nBcd|fdjhjkdfsh" ^ Consts.endw
   ^ "blahbkahfgdshjkf")) ["Abc"; "Bcd"]

let testExtractTickersFromHtmlNothing _ =
  assert_equal (HtmlParser.extractTickersFromHtml
    ("blahblahblah" ^ "Abc|sdljdk\nBcd|fdjhjkdfsh"
   ^ "blahbkahfgdshjkf")) []

let testsUrlGenerator =
  "test suite for UrlGenerator"
  >::: [
         "normal" >:: testUrlGeneratorNormal;
         "raises" >:: testUrlGeneratorRaises;
       ]

let testsHtmlParser =
  "test suite for HtmlParser"
  >::: [
         "normal" >:: testExtractTickersFromHtmlNormal;
         "NA" >:: testExtractTickersFromHtmlNothing;
       ]

let () =
  run_test_tt_main testsUrlGenerator;
  run_test_tt_main testsHtmlParser