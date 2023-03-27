module Deku.DOM.Elt.Pre where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Pre_

pre
  :: forall payload
   . Event (Attribute Pre_)
  -> Array (Domable payload)
  -> Domable payload
pre attributes kids = Domable
  ( Element'
      ( DC.elementify "pre" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

pre_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
pre_ = pre empty

pre__
  :: forall payload
   . String
  -> Domable payload
pre__ t = pre_ [ DC.text_ t ]
