module Main exposing (..)

import Browser
import Html exposing (Html, button, div, pre, text)
import Html.Events exposing (onClick)
import Http
import Json.Decode



-- MAIN


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }



-- MODEL


type Model
    = Failure
    | Loading
    | Success String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, Http.get { url = "https://api.quotable.io/random", expect = Http.expectString GotText } )



-- UPDATE


type Msg
    = GotText (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    ( Success fullText, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- todo: call quote api here as well
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    case model of
        Failure ->
            text "I was unable to grab a quote."

        Loading ->
            text "Loading..."

        Success fullText ->
            Html.pre [] [ text fullText ]
