module Tasks.List exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, attribute)
import Html.Events exposing (onClick)
import Tasks.Messages exposing (Msg(..))
import Tasks.Models exposing (..)


view : TaskList -> Html Msg
view model =
    div [ attribute "container" "" ]
        [ list (filteredTasks model.filter model.tasks)
        , div [ attribute "row" "" ]
            [ filterLink "Show All" All model
            , filterLink "Show Completed" ShowCompleted model
            , filterLink "Show Incompleted" ShowIncompleted model
            ]
        ]


filterLink : String -> TaskFilter -> TaskList -> Html Msg
filterLink description filter model =
    if filter == model.filter then
        span [ class "mr5" ] [ text description ]
    else
        a [ class "mr5", onClick (FilterSelected filter) ]
            [ text description ]


list : List Task -> Html Msg
list tasks =
    table [ class "table--full" ]
        [ thead []
            [ tr []
                [ th [] [ text "Task" ]
                , th [] [ text "Pomodoros" ]
                ]
            ]
        , tbody [] (List.map taskRow tasks)
        ]


taskRow : Task -> Html Msg
taskRow task =
    tr [ class (lineStyle task) ]
        [ td [ class "" ] [ text task.name ]
        , td [ class "" ] [ text (toString task.pomodoros) ]
        ]


lineStyle : Task -> String
lineStyle task =
    case task.status of
        Completed ->
            "line-through"

        Incompleted ->
            ""


filteredTasks : TaskFilter -> List Task -> List Task
filteredTasks filter tasks =
    case filter of
        All ->
            tasks

        ShowCompleted ->
            List.filter (\t -> t.status == Completed) tasks

        ShowIncompleted ->
            List.filter (\t -> t.status == Incompleted) tasks
