module Deku.Examples.Docs.Examples.Pursx2 where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do (useState')
import Deku.Do as Deku
import Deku.Pursx ((~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

myDom =
  Proxy
    :: Proxy
         """<div>
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
main = runInBody Deku.do
  push /\ event <- useState'
  myDom ~~
    { myli: pure (D.Style := "background-color:rgb(200,240,210);")
    , somethingNew:
        ( D.button (pure (D.OnClick := push (Just unit)))
            [ text
                $ (compact event $> "Thanks for clicking me!") <|>
                    pure "I was dynamically inserted"
            ]
        )
    }