module Main where

import Html exposing (..)
import Html.Attributes exposing (href, id, classList)

main : Html
main =
  main' []
    [ h1 [] [text "@jdoi.work"]
    , ul [ id "contacts" ]
      [ jumpTo "github" "https://github.com/jdoiwork/jdoiwork.github.io"
      , jumpTo "twitter" "https://twitter.com/jdoiwork"
      ]
    ]

jumpTo : String -> String -> Html
jumpTo title url =
  li []
    [ a [href url]
      [ faIcon title
      , text title
      ]
    ]

faIcon : String -> Html
faIcon key =
  let icon    = "fa-" ++ key
      classes = classList [("fa", True), (icon, True)]
      attrs   = [classes]
  in
    i attrs []