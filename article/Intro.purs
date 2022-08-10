module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Profunctor (lcmap)
import Deku.Attribute (attr)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (Event, bus)
import Type.Proxy (Proxy(..))

example name = bus
  \setAge -> lcmap (pure 1 <|> _) \age ->
    ( Proxy
        :: Proxy
             """
<div>
  <p>Hello ~name~. I'm guessing your age is ~age~.</p>
  <button ~setAge~>Guess again</button>
</div>
"""
    ) ~~
      { name: nut $ text name
      , age: nut $ text $ show <$> age
      , setAge: attr D.OnClick <<< setAge <<< add 1 <$> (age :: Event Int)
      }

main :: Effect Unit
main = runInBody1 (example (pure "Steve"))