module Main exposing (..)

-- Vendor Libraries
import Html     exposing (..)
import Browser

-- My Libraries
import About

type alias Model = About.Model

type alias Msg = About.Msg

main = Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

init : () -> (About.Model, Cmd About.Msg)
init _ = appInit

update = appUpdate
view = appView
subscriptions : About.Model -> Sub About.Msg
subscriptions model =
    Sub.none

appInit : (About.Model, Cmd About.Msg)
appInit = ([], About.getItems)

appView : About.Model -> Html About.Msg
appView = About.view

appUpdate : Msg -> Model -> (Model, Cmd About.Msg)
appUpdate = About.update
