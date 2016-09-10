module Main exposing (..)

import Html.App
import Models exposing (Model, initialModel)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update)
import Tasks.Commands exposing (fetchAll)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.map TaskMsg fetchAll )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
