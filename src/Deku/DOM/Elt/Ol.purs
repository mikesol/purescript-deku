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
  :: forall lock payload
   . Event (Attribute Ol_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ol attributes kids = Domable
  ( Element'
      ( DC.elementify "ol" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ol_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ol_ = ol empty


ol__
  :: forall lock payload
   . String
  -> Domable lock payload
ol__ t = ol_ [ DC.text_ t ]
