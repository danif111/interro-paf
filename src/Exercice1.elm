module Exercice1 exposing (..)

import Html exposing (Html)
import Array exposing (Array)
import String exposing (toInt)

type alias ArrayList =  Array (List Int)

listExample : List Int
listExample = [1, 3, 4, 7, 8, 9, 3, 4]

empty : Array a
empty = 
      Array.empty
     
insert : a -> (Array (List a)) -> (Array (List a))
insert n al = 
     let 
       len = Array.length al   
       last = Maybe.withDefault [] (Array.get (len - 1) al)
     in

      if (List.length last) == 3 then
        Array.push (n::[]) al
      else
        Array.set (len - 1) (last ++ (n::[])) al

--delete: a -> (Array (List a)) -> (Array (List a))
--delete n l =
       
get : Int -> (Array (List a)) ->  (List a)
get n al =
       Maybe.withDefault [] (Array.get (n - 1) al)

length : (Array (List a)) -> Int
length al =
          Array.length al

toList : (Array (List a)) -> List a
toList al = 
         let t = Array.toList al in
         case t of
             [] -> []
             x :: rest -> x :: toList (Array.fromList rest)

main : Html msg
main = Html.text (Debug.toString listExample)