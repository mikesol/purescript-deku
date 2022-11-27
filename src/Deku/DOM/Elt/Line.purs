module Deku.DOM.Elt.Line where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Line_

line
  :: forall lock payload
   . Event (Attribute Line_)
  -> Array (Domable lock payload)
  -> Domable lock payload
line attributes kids = Domable
  ( Element'
      ( DC.elementify "line" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

line_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
line_ = line empty

line__
  :: forall lock payload
   . String
  -> Domable lock payload
line__ t = line_ [ DC.text_ t ]
