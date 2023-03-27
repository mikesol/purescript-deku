module Deku.DOM.Elt.Table where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Table_

table
  :: forall payload
   . Event (Attribute Table_)
  -> Array (Domable payload)
  -> Domable payload
table attributes kids = Domable
  ( Element'
      ( DC.elementify "table" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

table_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
table_ = table empty

table__
  :: forall payload
   . String
  -> Domable payload
table__ t = table_ [ DC.text_ t ]
