module Deku.DOM.Elt.Colgroup where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Colgroup_

colgroup
  :: forall payload
   . Event (Attribute Colgroup_)
  -> Array (Domable payload)
  -> Domable payload
colgroup attributes kids = Domable
  ( Element'
      ( DC.elementify "colgroup" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

colgroup_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
colgroup_ = colgroup empty

colgroup__
  :: forall payload
   . String
  -> Domable payload
colgroup__ t = colgroup_ [ DC.text_ t ]
