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
  :: forall payload
   . Event (Attribute Symbol_)
  -> Array (Domable payload)
  -> Domable payload
symbol attributes kids = Domable
  ( Element'
      ( DC.elementify "symbol" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

symbol_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
symbol_ = symbol empty

symbol__
  :: forall payload
   . String
  -> Domable payload
symbol__ t = symbol_ [ DC.text_ t ]
