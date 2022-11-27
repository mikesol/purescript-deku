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
  :: forall lock payload
   . Event (Attribute Aside_)
  -> Array (Domable lock payload)
  -> Domable lock payload
aside attributes kids = Domable
  ( Element'
      ( DC.elementify "aside" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

aside_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
aside_ = aside empty


aside__
  :: forall lock payload
   . String
  -> Domable lock payload
aside__ t = aside_ [ DC.text_ t ]
