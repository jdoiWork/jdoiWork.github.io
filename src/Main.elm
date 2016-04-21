module Main where

-- Vendor Libraries
import Html     exposing (Html)
import Effects  exposing (Effects, Never)
import Signal   exposing (Address)
import Task     exposing (Task)
import StartApp exposing (App, start)

-- My Libraries
import About

type alias Model = About.Model

type alias Action = About.Action

main : Signal Html
main = app.html

app : App Model
app =
    start { init   = appInit
          , view   = appView
          , update = appUpdate
          , inputs = []
          }

port tasks : Signal (Task Never ())
port tasks =
    app.tasks

appInit : (Model, Effects Action)
appInit = ([], About.getItems)

appView : Address Action -> Model -> Html
appView _ m = About.view m

appUpdate : Action -> Model -> (Model, Effects Action)
appUpdate = About.update