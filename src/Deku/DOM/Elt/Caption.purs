module Deku.DOM.Elt.Caption where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Caption_

caption
  :: forall payload
   . Event (Attribute Caption_)
  -> Array (Domable payload)
  -> Domable payload
caption attributes kids = Domable
  ( Element'
      ( DC.elementify "caption" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

caption_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
caption_ = caption empty

caption__
  :: forall payload
   . String
  -> Domable payload
caption__ t = caption_ [ DC.text_ t ]
