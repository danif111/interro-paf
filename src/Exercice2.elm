module Exercice2 exposing (..)

import Browser
import Html exposing (Html,input, div, text, button)
import Html.Events exposing (onClick)
import Html.Attributes exposing (id)

type alias Journal = List Model

type alias Model =
  { 
       time :String
      , aboutDay : String
  }

type Msg
  = ButtonSave Model
  | OnInput String 

initialModel : Model
initialModel =
  { 
      time = "00:00"
      ,aboutDay =""
  }

update : Msg -> Model -> Model
update msg model =
  case msg of
    ButtonSave element ->
      {model = element }
    OnInput value ->
            { model | aboutDay = value }


viewTodo : String -> Html Msg
viewTodo todo =
  Html.p [] [ text todo ]

view : Model -> Html Msg
view model =
  --let todos = (List.map viewTodo model.personal.aboutDay) in
  div
    [ id "First" ]
    [ div [] [ Html.text "Journal" ]
    , input [ OnInput OnInput, value model.aboutDay ] []
    , div [ id "time" ] [Html.text (model.time)]
    , button [ onClick ButtonSave] [ text "Save me!" ]
    ]

main : Program () Model Msg
main =
  Browser.sandbox
    { init = initialModel
    , update = update
    , view = view
    }
