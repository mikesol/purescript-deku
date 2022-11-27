module Deku.DOM.Elt.Picture where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Picture_

picture
  :: forall lock payload
   . Event (Attribute Picture_)
  -> Array (Domable lock payload)
  -> Domable lock payload
picture attributes kids = Domable
  ( Element'
      ( DC.elementify "picture" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

picture_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
picture_ = picture empty


picture__
  :: forall lock payload
   . String
  -> Domable lock payload
picture__ t = picture_ [ DC.text_ t ]
