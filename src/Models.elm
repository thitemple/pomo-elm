module Models exposing (..)

import Tasks.Models exposing (TaskList, initialTaskListModel)


type alias Model =
    { taskList : TaskList }


initialModel : Model
initialModel =
    { taskList = initialTaskListModel
    }
