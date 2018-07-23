module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL


type alias Model =
    { person : Person
    , newName : String
    }


type alias Person =
    { name : String
    , surname : String
    , gender : Gender
    }


initModel : Model
initModel =
    { person = initPerson
    , newName = ""
    }


initPerson : Person
initPerson =
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
        [ greeting model.person
        , changeName model
        ]


greeting : Person -> Html Msg
greeting person =
    div []
        [ if person.gender == Male then
            text ("Hello Mr. " ++ person.surname ++ "!")
          else if person.gender == Female then
            text ("Hello Mrs. " ++ person.surname ++ "!")
          else
            text "Ups, something went wrong"
        ]


changeName : Model -> Html Msg
changeName model =
    div []
        [ input [ onInput NewName ] []
        , button [ onClick SaveNewName ] [ text "Save new name" ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        NewName name ->
            ( { model | newName = name }, Cmd.none )

        SaveNewName ->
            let
                oldPerson =
                    model.person

                newPerson =
                    { oldPerson | surname = model.newName }
            in
                ( { model | person = newPerson }, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | NewName String
    | SaveNewName



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
