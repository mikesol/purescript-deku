module Deku.DOM.Elt.Xdata where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Xdata_

xdata
  :: forall lock payload
   . Event (Attribute Xdata_)
  -> Array (Domable lock payload)
  -> Domable lock payload
xdata attributes kids = Domable
  ( Element'
      ( DC.elementify "data" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

xdata_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
xdata_ = xdata empty


xdata__
  :: forall lock payload
   . String
  -> Domable lock payload
xdata__ t = xdata_ [ DC.text_ t ]
