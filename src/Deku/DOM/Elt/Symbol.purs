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
  :: forall lock payload
   . Event (Attribute Symbol_)
  -> Array (Domable lock payload)
  -> Domable lock payload
symbol attributes kids = Domable
  ( Element'
      ( DC.elementify "symbol" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

symbol_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
symbol_ = symbol empty

symbol__
  :: forall lock payload
   . String
  -> Domable lock payload
symbol__ t = symbol_ [ DC.text_ t ]
