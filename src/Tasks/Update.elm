module Tasks.Update exposing (..)

import Tasks.Messages exposing (Msg(..))
import Tasks.Models exposing (TaskList)


update : Msg -> TaskList -> ( TaskList, Cmd Msg )
update message model =
    case message of
        FetchAllDone newTasks ->
            ( { model | tasks = newTasks }, Cmd.none )

        FetchAllFail error ->
            ( model, Cmd.none )

        FilterSelected filter ->
            ( { model | filter = filter }, Cmd.none )
