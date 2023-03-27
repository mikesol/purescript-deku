module Deku.DOM.Elt.Symbol where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Symbol_

symbol
  :: Event (Attribute Symbol_)
  -> Array Domable
  -> Domable
symbol attributes kids = Domable
  ( Element'
      ( DC.elementify "symbol" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

symbol_
  :: Array Domable
  -> Domable
symbol_ = symbol empty

symbol__
  :: String
  -> Domable
symbol__ t = symbol_ [ DC.text_ t ]
