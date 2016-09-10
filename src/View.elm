module View exposing (view)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Tasks.List


view : Model -> Html Msg
view model =
    div []
        [ Html.App.map TaskMsg (Tasks.List.view model.taskList) ]
