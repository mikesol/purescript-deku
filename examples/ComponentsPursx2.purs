module Deku.Example.Docs.Example.ComponentPursx2 where

import Prelude

import Deku.Toplevel ((🚀))
import Deku.Change (change)
import Deku.Control.Functions (u)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Pursx ((~!))
import Effect (Effect)
import Type.Proxy (Proxy(..))
main :: Effect Unit
main =
  ( \push ->
      ( u $ (Proxy :: _ """
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
      """) ~! {myli: D.li'attr [D.Style := "background-color:rgb(200,240,210);"]
      , somethingNew: D.button [D.OnClick := cb (const $ push unit)] (S.text "I was dynamically inserted")
      }
      )
  ) 🚀 \_ _ ->
    change
      { "root.psx.somethingNew.t": "Thanks for clicking me!"}
