module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL


type alias Model =
    { persons : List Person
    , newName : String
    }


type alias Person =
    { name : String
    , gender : Gender
    }


initModel : Model
initModel =
    { persons = initPersons
    , newName = ""
    }


initPersons : List Person
initPersons =
    [ { name = "Prestmo"
      , gender = Female
      }
    , { name = "Hansen"
      , gender = Male
      }
    ]


type Gender
    = Male
    | Female



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] (List.map greeting model.persons)
        ]


greeting : Person -> Html Msg
greeting person =
    div []
        [ if person.gender == Male then
            text ("Hello Mr. " ++ person.name ++ "!")
          else if person.gender == Female then
            text ("Hello Mrs. " ++ person.name ++ "!")
          else
            text "Ups, something went wrong"
        ]


changeName : Model -> Html Msg
changeName model =
    div []
        [ input [ onInput NewName ] []
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        NewName name ->
            ( { model | newName = name }, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | NewName String



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
