module Exercice2 exposing (..)

import Browser
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Html.Attributes exposing (id)

type alias Journal =
  { 
      time :String
      , aboutDay : String
   }
type alias Model =
  { 
      personal : List Journal
  }

type Msg
  = ButtonSave Journal

initialModel : Model
initialModel =
  { 
      personal = []
  }

update : Msg -> Model -> Model
update msg model =
  case msg of
    ButtonSave element ->
      { model |
        personal = element :: model.personal }


viewTodo : String -> Html Msg
viewTodo todo =
  Html.p [] [ text todo ]

view : Model -> Html Msg
view model =
  let todos = (List.map viewTodo model.personal.aboutDay) in
  div
    [ id "First" ]
    [ div [ id "time" ] [Html.text (model.personal.time)]
    , div [ id "about" ] todos
    , button [ onClick ButtonSave] [ text "Save me!" ]
    ]

main : Program () Model Msg
main =
  Browser.sandbox
    { init = initialModel
    , update = update
    , view = view
    }
