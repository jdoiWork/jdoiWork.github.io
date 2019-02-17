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

type Msg = AboutMsg About.Msg

main = Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

init : () -> (Model, Cmd Msg)
init _ = appInit

update = appUpdate

view : Model -> Html Msg
view = appView

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

appInit : (Model, Cmd Msg)
appInit = ( { about = [] }, Cmd.map AboutMsg About.getItems)

appView : Model -> Html Msg
appView model = map AboutMsg (About.view model.about)

appUpdate : Msg -> Model -> (Model, Cmd Msg)
appUpdate msg model =
    case msg of
        AboutMsg subMsg ->
            About.update subMsg model.about
            |> updateWith (\about -> {model | about = about}) AboutMsg


updateWith : (subModel -> Model) -> (subMsg -> Msg) -> (subModel, Cmd subMsg) -> (Model, Cmd Msg)
updateWith toModel toMsg (subModel, subCmd) =
    (toModel subModel, Cmd.map toMsg subCmd)

