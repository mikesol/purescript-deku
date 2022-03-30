module Deku.Examples.Docs.Examples.Component where

import Prelude

import Deku.Control (flatten, text_)
import Deku.DOM as D
import Deku.Attribute ((:=))
import Deku.Toplevel ((🚀))
import Effect (Effect)

main :: Effect Unit
main = unit 🚀 \_ _ ->
  flatten
    [ D.button_ [ text_ "I do nothing" ]
    , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]
    , D.div_
        [ D.a (pure $ D.Href := "https://example.com")
            [ text_ "foo " ]
        , D.i_ [ text_ " bar " ]
        , D.span (pure $ D.Style := "font-weight: 800;")
            [ text_ " baz" ]
        ]
    , D.div_
        [ D.div_
            [ D.div_ [ D.input (pure $ D.Xtype := "range") [] ]
            ]
        ]
    ]