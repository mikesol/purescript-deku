module Deku.Example.Docs.Example.Component where

import Prelude

import Data.Foldable (for_)
import Data.Vec ((+>), empty)
import Deku.Graph.DOM ((:=), root)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions.Graph (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Deku.Util (detup, vex)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: forall env dom engine push res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 push res
scene elt =
  ( \_ _ ->
      ( icreate $ root elt
          ( { button: D.button [] { t: D.text "I do nothing" }
            , list: D.ul []
                $ vex
                $ map (D.li [] <<< S.text)
                  ("A" +> "B" +> "C" +> empty)
            , rando: D.div []
                $ detup
                $ D.a [] (S.text "foo ")
                  /\ D.i [] (S.text " bar ")
                  /\ D.span [ D.Style := "font-weight: 800;" ] (S.text " baz")
                  /\
                    unit
            , lotsOfDivs: D.div []
                $ S.div []
                $ S.div []
                $ S.input [ D.Xtype := "range" ] {}
            }
          )
      )
  ) @!> freeze

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi
          (scene elt)

      )
      (_.res >>> pure)
