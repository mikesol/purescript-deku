module Deku.DOM.Elt.Ol where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ol_

ol
  :: forall payload
   . Event (Attribute Ol_)
  -> Array (Domable payload)
  -> Domable payload
ol attributes kids = Domable
  ( Element'
      ( DC.elementify "ol" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ol_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
ol_ = ol empty

ol__
  :: forall payload
   . String
  -> Domable payload
ol__ t = ol_ [ DC.text_ t ]
