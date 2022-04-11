module Deku.Examples.Docs.Examples.Pursx2 where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Deku.Attribute (cb, (:=))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Deku.Toplevel ((🚀))
import Effect (Effect)
import FRP.Event.Class (bang)
import Type.Proxy (Proxy(..))

myDom = Proxy :: Proxy """<div>
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
"""

main :: Effect Unit
main = Nothing 🚀 \push event -> myDom ~~
  { myli: bang (D.Style := "background-color:rgb(200,240,210);")
  , somethingNew: nut
      ( D.button (bang (D.OnClick := cb (const $ push (Just unit))))
          [ text
              $ (compact event $> "Thanks for clicking me!") <|>
                  bang "I was dynamically inserted"
          ]
      )
  }