module Deku.Example.Docs.Example.ComponentPursx where

import Prelude

import Data.Foldable (for_)
import Deku.Control.Functions (freeze, u, (@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.DOM (root)
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
  :: forall env dom engine push res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 push res
scene elt =
  ( \_ _ ->
      ( u $ root elt $ (Proxy :: _ """
      <div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
      """) ~! {}
      )
  ) @> freeze

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi(scene elt)      )
      (_.res >>> pure)
