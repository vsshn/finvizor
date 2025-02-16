open OUnit2
open TickerGetterHelpers

let testUrlGeneratorNormal _ = 
  assert_equal "base&r=21" (UrlGenerator.generateUrl "base" 1);
  assert_equal "base&r=401" (UrlGenerator.generateUrl "base" 20)

let tests = "test suite for UrlGenerator" >::: [
  "normal" >:: testUrlGeneratorNormal;
  "singleton" >:: (fun _ -> assert_equal 1 (1));
  "two_elements" >:: (fun _ -> assert_equal 3 (3));
]

let _ = run_test_tt_main tests