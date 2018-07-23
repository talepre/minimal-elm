module Main exposing (..)

import Html exposing (..)


-- MODEL


type alias Model =
    String



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text model ]



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- MESSAGES


type Msg
    = NoOp



-- MAIN


main : Program Never Model Msg
main =
    beginnerProgram
        { model = "Hello Elm!"
        , view = view
        , update = update
        }
