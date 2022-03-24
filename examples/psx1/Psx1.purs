module Deku.Example.Psx1 where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Deku.Change (change)
import Deku.Control.Functions (u, (@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (root, text, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Pursx (psx)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Type.Proxy (Proxy(..))
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: WEB.DOM.Element
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 Unit Unit
scene elt =
  ( \_ push ->
      u $ root elt
        { txt: text "i am some text"
        , btn: D.button [D.OnClick := cb (const $ push unit)] (S.text "change stuff")
        , psxClosure: psx
            ( Proxy
                :: _
                  "<div><input /></div>"
            )
            {}
        , psx0: psx
            ( Proxy
                :: _
                  "<div>i am a div <a href=\"https://www.example.com\">i am a link</a></div>"
            )
            {}
        , psx1: psx
            ( Proxy
                :: _
                  "<div ~mydiv~>i am another div <a href=\"https://www.example.com\">i am another link</a></div>"
            )
            { mydiv: [ D.Style := "background-color: rgb(140,234,235);" ] }
        , psx2: psx
            ( Proxy
                :: _
                  "<div ~mydiv~>i am yet another div <a href=\"https://www.example.com\">i am yet another link</a> ~inner~</div>"
            )
            { mydiv: [ D.Style := "background-color: rgb(140,234,235);" ], inner: (D.div [] (S.text "hello world")) }
        }
  ) @> \e _ ->
    case e of
      Left _ -> pure unit
      Right _ -> change {
        "root.psx2.mydiv": D.div'attr [ D.Style := "background-color: rgb(0,4,235);" ]
        ,"root.psx1.mydiv": D.div'attr [ D.Style := "background-color: rgb(0,56,2);" ]
        ,"root.psx2.inner.t": "works"
      }

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
