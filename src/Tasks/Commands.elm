module Tasks.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=), succeed)
import Task as IoTask
import Tasks.Models exposing (..)
import Tasks.Messages exposing (Msg(..))


fetchAll : Cmd Msg
fetchAll =
    Http.get collectionDecoder fetchAllUrl
        |> IoTask.perform FetchAllFail FetchAllDone


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/tasks"


collectionDecoder : Decode.Decoder (List Task)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Task
memberDecoder =
    Decode.object4 Task
        ("id" := Decode.int)
        ("name" := Decode.string)
        ("pomodoros" := Decode.int)
        (("concluded" := Decode.bool) `Decode.andThen` decodeTaskStatus)


decodeTaskStatus : Bool -> Decode.Decoder TaskStatus
decodeTaskStatus status =
    succeed (taskStatus status)


taskStatus : Bool -> TaskStatus
taskStatus val =
    case val of
        True ->
            Completed

        False ->
            Incompleted
