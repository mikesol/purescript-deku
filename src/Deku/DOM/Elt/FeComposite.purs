module Deku.DOM.Elt.FeComposite where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeComposite_

feComposite
  :: forall payload
   . Event (Attribute FeComposite_)
  -> Array (Domable payload)
  -> Domable payload
feComposite attributes kids = Domable
  ( Element'
      ( DC.elementify "feComposite" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feComposite_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feComposite_ = feComposite empty

feComposite__
  :: forall payload
   . String
  -> Domable payload
feComposite__ t = feComposite_ [ DC.text_ t ]
