module Update exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Tasks.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TaskMsg subMsg ->
            let
                ( updatedTaskList, cmd ) =
                    Tasks.Update.update subMsg model.taskList
            in
                ( { model | taskList = updatedTaskList }, Cmd.map TaskMsg cmd )
