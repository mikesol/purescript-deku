module Deku.DOM.Elt.Meta where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Meta_

meta
  :: forall payload
   . Event (Attribute Meta_)
  -> Array (Domable payload)
  -> Domable payload
meta attributes kids = Domable
  ( Element'
      ( DC.elementify "meta" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

meta_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
meta_ = meta empty

meta__
  :: forall payload
   . String
  -> Domable payload
meta__ t = meta_ [ DC.text_ t ]
