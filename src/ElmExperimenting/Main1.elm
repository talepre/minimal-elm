module Main exposing (..)

import Html exposing (..)


-- MODEL


type alias Model =
    { name : String
    , surname : String
    }


initModel : Model
initModel =
    { name = "Tale"
    , surname = "Prestmo"
    }



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text ("Hello " ++ model.name ++ " " ++ model.surname ++ "!") ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )
