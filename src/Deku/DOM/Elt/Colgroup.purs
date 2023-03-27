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
  :: Event (Attribute Colgroup_)
  -> Array Domable
  -> Domable
colgroup attributes kids = Domable
  ( Element'
      ( DC.elementify "colgroup" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

colgroup_
  :: Array Domable
  -> Domable
colgroup_ = colgroup empty

colgroup__
  :: String
  -> Domable
colgroup__ t = colgroup_ [ DC.text_ t ]
