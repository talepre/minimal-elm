module Main exposing (..)

import Html exposing (..)


-- MODEL


type alias Model =
    { name : String
    , surname : String
    , gender : Gender
    }


initModel : Model
initModel =
    { name = "Tale"
    , surname = "Prestmo"
    , gender = Female
    }


type Gender
    = Male
    | Female



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ if model.gender == Male then
            text ("Hello Mr. " ++ model.surname ++ "!")
          else if model.gender == Female then
            text ("Hello Mrs. " ++ model.surname ++ "!")
          else
            text "Ups, something went wrong"
        ]



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
