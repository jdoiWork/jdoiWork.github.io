module Games exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view : Html ()
view =
  section []
  [ h2 [] [text "Games"]
  , ul []
    [ li [] [a [href "/g2048"] [text "G2048"]]

    ]
  ]
