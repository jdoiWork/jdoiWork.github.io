module About exposing (..)

import Task    exposing (Task)
import Result exposing (toMaybe)
import Json.Decode as Json exposing (field)
import Http exposing (get)
import Html exposing (..)
import Html.Attributes exposing
  ( href
  , id
  , class
  , classList
  )

type alias Model = List About

type alias About =
  { title : String
  , url   : String
  }

type Action = Request
            | Response Model

view : List About -> Html
view items =
  main_ []
    [ h1 [ id "home-logo"] [text "jdoi.pw"]
    , ul [ id "about" ]
         (List.map jumpTo items) 
    ]

jumpTo : About -> Html
jumpTo item =
  li []
    [ a [href item.url]
      [ span [class "trademark" ] []
      , span [class "brand-name"] [text item.title]
      ]
    ]

getItems : Effects Action
getItems =
  get decoder "dst/about.json"
    |> Task.toMaybe
    |> Task.map (Maybe.withDefault [])
    |> Task.map Response
    |> Effects.task

decoder : Json.Decoder Model
decoder =
  Json.at ["about"]
    (Json.list aboutDecoder)

aboutDecoder : Json.Decoder About
aboutDecoder =
  Json.object2 About
    (field "title" Json.string)
    (field "url" Json.string)

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Request        -> ([], getItems)
    Response items -> (items, Effects.none)
