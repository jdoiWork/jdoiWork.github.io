module Main exposing (..)

-- Vendor Libraries
import Html     exposing (..)
--import Task     exposing (Task)
import Browser

-- My Libraries
--import About

--type alias Model = About.Model

--type alias Action = About.Action

main = Browser.sandbox { init = init, update = update, view = view }

type alias Model =
    {
        name : String
    }

init : Model
init = Model "name"

type Msg
    = Name String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

view : Model -> Html Msg
view model =
    div [] [text "hello"]
-- app : App Model
-- app =
--     start { init   = appInit
--           , view   = appView
--           , update = appUpdate
--           , inputs = []
--           }
{-
port tasks : Signal (Task Never ())
port tasks =
    app.tasks
-}
-- appInit : (Model, Effects Action)
-- appInit = ([], About.getItems)

-- appView : Address Action -> Model -> Html
-- appView _ m = div [] [] --About.view m

-- appUpdate : Action -> Model -> (Model, Effects Action)
-- appUpdate = About.update
