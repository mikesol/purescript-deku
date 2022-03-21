module Deku.Example.Docs.Example.SSR where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Maybe (maybe)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions.Graph (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene, oneFrame)
import Deku.Create (icreate)
import Deku.Graph.DOM (root)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Deku.SSR (ssr, toXML)
import Deku.Util (detup)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: forall env dom engine push
   . DOMInterpret dom engine
  => Int
  -> Element
  -> Scene env dom engine Frame0 push Unit
scene i elt =
  ( \_ _ ->
      ( icreate $ root elt
          ( detup $ D.p [] (S.text "Here is some XML!") /\ D.pre []
              ( S.code []
                  ( S.text $ if i > 3 then "<stack-overflow />" else
                      ( maybe "" toXML
                          ( ssr
                              ( map ((#) unit)
                                  ( oneFrame
                                      (scene (i+1) elt)
                                      (Left unit)
                                      (const $ pure unit)
                                  ).instructions
                              )
                          )
                      )
                  )
              ) /\ unit
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
          (scene 0 elt)

      )
      (_.res >>> pure)
