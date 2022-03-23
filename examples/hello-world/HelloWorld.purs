module Deku.Example.HelloWorld where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Deku.Change (change)
import Deku.Control.Functions ((@>))
import Deku.Control.Types (Frame0, Scene)
import Data.Tuple.Nested ((/\))
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (OnClick(..), Href(..), a, a'attr, root, text, (:=))
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: WEB.DOM.Element
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 Boolean Unit
scene elt =
  ( \_ push ->
      ( root elt
          { hello: text "click "
          , helloA: a [ Href := "#", OnClick := cb (const $ push false) ]
              { world: text "me" }
          } /\ push
      )
  ) @> \e push ->
    case e of
      Left _ -> pure push
      Right tf ->
        change
          { "root.hello": if tf then "click " else "kcilc "
          , "root.helloA": a'attr [ OnClick := cb (const $ push (not tf)) ]
          } $> push

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
