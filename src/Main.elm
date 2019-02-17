module Main exposing (..)

-- Vendor Libraries
import Html     exposing (..)
--import Task     exposing (Task)
import Browser

-- My Libraries
import About

type alias Model = About.Model

type alias Msg = About.Action

main = Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

-- type alias Model =
--     {
--         name : String
--     }

init : () -> (About.Model, Cmd About.Action)
init _ = appInit

update = appUpdate
view = appView
subscriptions : About.Model -> Sub About.Action
subscriptions model =
    Sub.none
-- type Msg
--     = Name String

-- update : Msg -> Model -> Model
-- update msg model =
--     case msg of
--         Name name ->
--             { model | name = name }

-- view : Model -> Html Msg
-- view model =
--     div [] [text "hello"]
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
appInit : (About.Model, Cmd About.Action)
appInit = ([], About.getItems)

appView : About.Model -> Html About.Action
appView = About.view

appUpdate : Msg -> Model -> (Model, Cmd About.Action)
appUpdate = About.update
