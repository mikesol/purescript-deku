module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Profunctor (lcmap)
import Deku.Attribute (attr)
import Deku.Control (plant, text)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bus, bang)
import Type.Proxy (Proxy(..))

example name = bus
 \setAge -> lcmap (bang 1 <|> _) \age -> plant $
    ( Proxy:: Proxy
"""
<div>
  <p>Hello ~name~. I'm guessing your age is ~age~.</p>
  <button ~setAge~>Guess again</button>
</div>
"""
    ) ~~
      { name: nut $ text name
      , age: nut $ text $ show <$> age
      , setAge: attr D.OnClick <<< setAge <<< add 1 <$> age
      }

main :: Effect Unit
main = runInBody1 (example (bang "Steve"))