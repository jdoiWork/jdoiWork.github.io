module Main exposing (..)

-- Vendor Libraries
import Html     exposing (..)
import Browser

-- My Libraries
import About

--type alias Model = About.Model
type alias Model =
    { about : About.Model

    }

type alias Msg = About.Msg

main = Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

init : () -> (Model, Cmd About.Msg)
init _ =
    let (about, aboutMsg) = appInit
    in ({ about = about }, aboutMsg )

update = appUpdate

view : Model -> Html About.Msg
view = appView

subscriptions : Model -> Sub About.Msg
subscriptions model = Sub.none

appInit : (About.Model, Cmd About.Msg)
appInit = ([], About.getItems)

appView : Model -> Html About.Msg
appView model = About.view model.about

appUpdate : Msg -> Model -> (Model, Cmd About.Msg)
appUpdate msg model =
    let (about, aboutMsg) = About.update msg model.about
    in ({about = about}, aboutMsg)
