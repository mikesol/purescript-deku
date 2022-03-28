module Deku.Example.Docs.Example.Component where

import Prelude

import Data.Tuple.Nested ((/\))
import Data.Vec ((+>), empty)
import Deku.Control.Functions (freeze, u)
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Toplevel ((🚀))
import Deku.Util ((@@), vex)
import Effect (Effect)

main :: Effect Unit
main =
  ( const $ u $
      { button: D.button [] { t: D.text "I do nothing" }
      , list: D.ul []
          $ vex
          $ map (D.li [] <<< S.text)
            ("A" +> "B" +> "C" +> empty)
      , rando: D.div []
          $ D.a [ D.Href := "https://example.com" ]
              (S.text "foo ")
              @@ D.i [] (S.text " bar ")
              /\ D.span [ D.Style := "font-weight: 800;" ]
                (S.text " baz")
              /\ unit
      , lotsOfDivs: D.div []
          $ S.div []
          $ S.div []
          $ S.input [ D.Xtype := "range" ] {}
      }
  ) 🚀 freeze
