let generateUrl 
(baseUrl : string)
(index : int)
 : string =
  let tickersPerPage = 20 in 
  let connection = "&r=" in 
  baseUrl ^ connection ^ (string_of_int (tickersPerPage * index + 1))