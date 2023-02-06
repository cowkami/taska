module Main exposing (main)

import Browser
import Dict exposing (Dict)
import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)
import UUID exposing (UUID)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Task =
    { title : String, description : String }


type alias Tasks =
    Dict String Task


initTasks : Tasks
initTasks =
    Dict.empty


type alias Model =
    { tasks : Tasks }


init : Model
init =
    { tasks = initTasks }



-- UPDATE


type Msg
    = AddTask
    | DeleteTask


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddTask ->
            { tasks =
                Dict.insert
                    "hey"
                    { title = "todo1"
                    , description = "yaruze-"
                    }
                    model.tasks
            }

        DeleteTask ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "ToDo" ]
        , div []
            [ button [ onClick AddTask ] [ text "+" ]
            , viewTasks model.tasks
            ]
        ]


viewTasks : Tasks -> Html Msg
viewTasks tasks =
    div []
        (if Dict.isEmpty tasks then
            []

         else
            List.map (Tuple.second >> viewTask) (Dict.toList tasks)
        )


viewTask : Task -> Html Msg
viewTask task =
    div []
        [ text task.title
        , text task.description
        ]
