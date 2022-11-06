module Deku.Examples.Docs.Examples.Component where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((!:=), (:=))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody
  ( D.div_
      [ D.button_ [ text_ "I do nothing" ]
      , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]
      , D.div_
          [ D.a (pure $ D.Href := "https://example.com")
              [ text_ "foo " ]
          , D.i_ [ text_ " bar " ]
          , D.span (pure $ D.Style := "font-weight: 800;")
              [ text_ " baz" ]
          ]
      , D.svg (oneOf [ D.Height !:= "100", D.Width !:= "100" ])
          [ D.circle
              ( oneOf
                  [ D.Cx !:= "50"
                  , D.Cy !:= "50"
                  , D.R !:= "40"
                  , D.Stroke !:= "black"
                  , D.StrokeWidth !:= "3"
                  , D.Fill !:= "red"
                  ]
              )
              []
          ]

      ]
  )