module Deku.Example.Docs.Example.ComponentPursx2 where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Deku.Change (change)
import Deku.Control.Functions (u, (@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM ((:=), root)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Pursx ((~!))
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Type.Proxy (Proxy(..))
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: forall env dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 Unit res
scene elt =
  ( \_ push ->
      ( u $ root elt $ (Proxy :: _ """
      <div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
      """) ~! {myli: D.li'attr [D.Style := "color:0x2fefef;"]
      , somethingNew: D.button [D.OnClick := cb (const $ push unit)] (S.text "I was dynamically inserted")
      }
      )
  ) @> \e _ -> case e of
    Left _ -> pure unit
    Right _ -> change { "root.psx.somethingNew.t": "Thanks for clicking me!"}

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi(scene elt)      )
      (_.res >>> pure)
