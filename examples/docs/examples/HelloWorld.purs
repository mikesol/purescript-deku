module Deku.Example.Docs.Example.HelloWorld where

import Prelude

import Data.Foldable (for_)
import Deku.Control.Functions (freeze, u, (@>))
import Deku.Graph.DOM (root)
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi
          $
            ( \_ _ -> u $ root elt (S.text "Hello world")
            ) @> freeze

      )
      (_.res >>> pure)
