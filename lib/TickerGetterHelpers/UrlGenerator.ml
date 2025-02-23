let generateUrl 
(baseUrl : string)
(index : int)
 : string =
 if index < 0 then invalid_arg "Page number cannot be negative";
  let tickersPerPage = 20 in 
  let connection = "&r=" in 
  baseUrl ^ connection ^ (string_of_int (tickersPerPage * index + 1))