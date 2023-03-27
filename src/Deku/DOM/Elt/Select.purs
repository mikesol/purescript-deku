module Deku.DOM.Elt.Select where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Select_

select
  :: forall payload
   . Event (Attribute Select_)
  -> Array (Domable payload)
  -> Domable payload
select attributes kids = Domable
  ( Element'
      ( DC.elementify "select" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

select_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
select_ = select empty

select__
  :: forall payload
   . String
  -> Domable payload
select__ t = select_ [ DC.text_ t ]
