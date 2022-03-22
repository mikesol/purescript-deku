module Deku.Example.HelloWorld where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Deku.Change (ichange)
import Deku.Control.Functions.Graph (iloop, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
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
      ( icreate $
          root elt
            { hello: text "click "
            , helloA: a [ Href := "#", OnClick := cb (const $ push false) ]
                { world: text "me" }
            }
      )
  ) @!> iloop \e push _ ->
    case e of
      Left _ -> pure unit
      Right tf -> ichange
        { "root.hello": if tf then "click " else "kcilc "
        , "root.helloA": a'attr [ OnClick := cb (const $ push (not tf)) ]
        }

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
