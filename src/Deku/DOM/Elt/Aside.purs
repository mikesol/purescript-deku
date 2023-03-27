module Deku.DOM.Elt.Aside where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Aside_

aside
  :: forall payload
   . Event (Attribute Aside_)
  -> Array (Domable payload)
  -> Domable payload
aside attributes kids = Domable
  ( Element'
      ( DC.elementify "aside" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

aside_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
aside_ = aside empty

aside__
  :: forall payload
   . String
  -> Domable payload
aside__ t = aside_ [ DC.text_ t ]
