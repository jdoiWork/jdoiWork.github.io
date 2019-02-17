module About exposing (..)

import Task    exposing (Task)
import Result exposing (toMaybe)
import Json.Decode as Json exposing (field, map2)
--import Http exposing (get)
import Http 
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
            | Response (Result Http.Error Model)

view : List About -> Html Action
view items =
  main_ []
    [ h1 [ id "home-logo"] [text "jdoi.pw"]
    , ul [ id "about" ]
         (List.map jumpTo items) 
    ]

jumpTo : About -> Html Action
jumpTo item =
  li []
    [ a [href item.url]
      [ span [class "trademark" ] []
      , span [class "brand-name"] [text item.title]
      ]
    ]

getItems : Cmd Action
getItems =
  Http.get
    { url = "./about.json"
    , expect = Http.expectJson Response decoder
    }
  
--itemsDecoder : decoder 
  -- get decoder "dst/about.json"
  --   |> toMaybe
  --   |> Task.map (Maybe.withDefault [])
  --   |> Task.map Response
  --   |> Cmd.batch

decoder : Json.Decoder Model
decoder =
  Json.at ["about"]
    (Json.list aboutDecoder)

aboutDecoder : Json.Decoder About
aboutDecoder =
  map2 About
    (field "title" Json.string)
    (field "url" Json.string)

update : Action -> Model -> (Model, Cmd Action)
update action model =
  case action of
    Request        -> ([], getItems)
    Response result -> -- (items, Cmd.none)
      case result of
        Ok items -> (items, Cmd.none)
        Err _ -> ([], Cmd.none)
