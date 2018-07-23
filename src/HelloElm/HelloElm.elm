module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL


type alias Person =
    { name : String
    , surname : String
    , gender : Gender
    }


type alias Model =
    { persons : List Person
    , newName : String
    }


initModel : Model
initModel =
    { persons = [ initPerson, initPerson2 ]
    , newName = ""
    }


initPerson : Person
initPerson =
    { name = "Tale"
    , surname = "Prestmo"
    , gender = Female
    }


initPerson2 : Person
initPerson2 =
    { name = "Per"
    , surname = "K"
    , gender = Male
    }


type Gender
    = Male
    | Female



-- VIEW


view : Model -> Html Msg
view model =
    div [] (List.map greeting model.persons)


greeting : Person -> Html Msg
greeting person =
    div [ class "hei" ]
        [ if person.gender == Male then
            text ("Hello Mr. " ++ person.surname ++ "!")
          else if person.gender == Female then
            text ("Hello Mrs. " ++ person.surname ++ "!")
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
