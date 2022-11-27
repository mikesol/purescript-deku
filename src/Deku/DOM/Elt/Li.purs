module Deku.DOM.Elt.Li where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Li_

li
  :: forall lock payload
   . Event (Attribute Li_)
  -> Array (Domable lock payload)
  -> Domable lock payload
li attributes kids = Domable
  ( Element'
      ( DC.elementify "li" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

li_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
li_ = li empty

li__
  :: forall lock payload
   . String
  -> Domable lock payload
li__ t = li_ [ DC.text_ t ]
