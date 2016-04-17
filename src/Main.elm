module Main where

import Html exposing (..)
import Html.Attributes exposing (href)

main : Html
main =
  main' []
    [ h1 [] [text "@jdoi.work"]
    , ul []
      [ jumpTo "github" "https://github.com/jdoiwork/jdoiwork.github.io"
      , jumpTo "twitter" "https://twitter.com/jdoiwork"
      ]
    ]

jumpTo : String -> String -> Html
jumpTo title url =
  li []
    [ a [href url] [text title] ]