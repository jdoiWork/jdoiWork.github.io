module About where

import Task exposing (Task, toMaybe)
import Effects exposing (Effects)
import Json.Decode as Json exposing ((:=))
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

view : Html
view =
  main' []
    [ h1 [ id "home-logo"] [text "jdoi.pw"]
    , ul [ id "about" ]
      [ jumpTo "github" "https://github.com/jdoiwork/jdoiwork.github.io"
      , jumpTo "twitter" "https://twitter.com/jdoiwork"
      ]
    ]

view' : List About -> Html
view' items =
  main' []
    [ h1 [ id "home-logo"] [text "jdoi.pw"]
    , ul [ id "about" ]
         (List.map jumpTo' items) 
    ]

jumpTo : String -> String -> Html
jumpTo title url =
  li []
    [ a [class title, href url]
      [ faIcon title
      , span [] [text title]
      ]
    ]

jumpTo' : About -> Html
jumpTo' item =
  li []
    [ a [class item.title, href item.url]
      [ faIcon item.title
      , span [] [text item.title]
      ]
    ]

faIcon : String -> Html
faIcon key =
  let icon    = "fa-" ++ key
      classes = classList [("fa", True), (icon, True)]
      attrs   = [classes]
  in
    i attrs []

getItems : Effects Action
getItems =
  get decoder "dst/about.json"
    |> Task.toMaybe
    |> Task.map (Maybe.withDefault [])
    |> Task.map Response
    |> Effects.task

decoder : Json.Decoder Model
decoder =
  Json.list aboutDecoder

aboutDecoder : Json.Decoder About
aboutDecoder =
  Json.object2 About
    ("title" := Json.string)
    ("url"   := Json.string)

toList : Maybe a -> List a
toList x =
  case x of
    Just a  -> [a]
    Nothing -> []

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Request -> ([], getItems)
    Response items -> (items, Effects.none)