module Tasks.Messages exposing (..)

import Http
import Tasks.Models exposing (Task, TaskFilter)


type Msg
    = FetchAllDone (List Task)
    | FetchAllFail Http.Error
    | FilterSelected TaskFilter
