module About exposing (..)

import Json.Decode as Json exposing (field, map2)
import Http 
import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model = List About

type alias About =
  { title : String
  , url   : String
  }

type Msg = Request
         | Response (Result Http.Error Model)

view : List About -> Html Msg
view items =
  ul [ id "about" ] (List.map jumpTo items) 

jumpTo : About -> Html Msg
jumpTo item =
  li []
    [ a [href item.url]
      [ span [class "trademark" ] []
      , span [class "brand-name"] [text item.title]
      ]
    ]

getItems : Cmd Msg
getItems =
  Http.get
    { url = "/dst/about.json"
    , expect = Http.expectJson Response decoder
    }
  
decoder : Json.Decoder Model
decoder =
  Json.at ["about"]
    (Json.list aboutDecoder)

aboutDecoder : Json.Decoder About
aboutDecoder =
  map2 About
    (field "title" Json.string)
    (field "url" Json.string)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Request        -> ([], getItems)
    Response result ->
      case result of
        Ok items -> (items, Cmd.none)
        Err _ -> ([], Cmd.none)
