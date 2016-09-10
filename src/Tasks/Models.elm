module Tasks.Models exposing (..)


type alias TaskId =
    Int


type TaskStatus
    = Completed
    | Incompleted


type alias Task =
    { id : TaskId
    , name : String
    , pomodoros : Int
    , status : TaskStatus
    }


type TaskFilter
    = All
    | ShowCompleted
    | ShowIncompleted


type alias TaskList =
    { tasks : List Task
    , filter : TaskFilter
    }


new : Task
new =
    { id = 0
    , name = ""
    , pomodoros = 0
    , status = Incompleted
    }


initialTaskListModel : TaskList
initialTaskListModel =
    { tasks = []
    , filter = All
    }
