module Deku.DOM.Elt.Polygon where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Polygon_

polygon
  :: forall lock payload
   . Event (Attribute Polygon_)
  -> Array (Domable lock payload)
  -> Domable lock payload
polygon attributes kids = Domable
  ( Element'
      ( DC.elementify "polygon" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

polygon_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
polygon_ = polygon empty

polygon__
  :: forall lock payload
   . String
  -> Domable lock payload
polygon__ t = polygon_ [ DC.text_ t ]
