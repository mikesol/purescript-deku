module Deku.Example.Docs.Example.ComponentPursx where

import Prelude

import Deku.Toplevel ((🚀))
import Deku.Control.Functions (freeze, u)
import Deku.Pursx ((~!))
import Effect (Effect)
import Type.Proxy (Proxy(..))

main :: Effect Unit
main =
  ( const $ u $
      ( Proxy
          :: _
            """
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
      """
      ) ~! {}
  ) 🚀 freeze
