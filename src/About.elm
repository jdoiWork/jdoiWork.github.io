module About where

import Html exposing (..)
import Html.Attributes exposing
  ( href
  , id
  , class
  , classList
  )

view : Html
view =
  main' []
    [ h1 [ id "home-logo"] [text "jdoi.pw"]
    , ul [ id "about" ]
      [ jumpTo "github" "https://github.com/jdoiwork/jdoiwork.github.io"
      , jumpTo "twitter" "https://twitter.com/jdoiwork"
      ]
    ]

jumpTo : String -> String -> Html
jumpTo title url =
  li []
    [ a [class title, href url]
      [ faIcon title
      , span [] [text title]
      ]
    ]

faIcon : String -> Html
faIcon key =
  let icon    = "fa-" ++ key
      classes = classList [("fa", True), (icon, True)]
      attrs   = [classes]
  in
    i attrs []