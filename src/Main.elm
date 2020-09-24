module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    String


init : Model
init =
    "Quotable quotes go here"



--TODO: call quote api
-- UPDATE


type Msg
    = Next


update : Msg -> Model -> Model
update msg model =
    case msg of
        Next ->
            "Next quote"



-- TODO: call quote api here as well
-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model
        , button [ onClick Next ] [ text "Next Quote" ]
        ]
