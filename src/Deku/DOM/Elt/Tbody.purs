module Deku.DOM.Elt.Tbody where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tbody_

tbody
  :: forall payload
   . Event (Attribute Tbody_)
  -> Array (Domable payload)
  -> Domable payload
tbody attributes kids = Domable
  ( Element'
      ( DC.elementify "tbody" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tbody_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
tbody_ = tbody empty

tbody__
  :: forall payload
   . String
  -> Domable payload
tbody__ t = tbody_ [ DC.text_ t ]
