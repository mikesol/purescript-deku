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
  :: forall lock payload
   . Event (Attribute Table_)
  -> Array (Domable lock payload)
  -> Domable lock payload
table attributes kids = Domable
  ( Element'
      ( DC.elementify "table" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

table_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
table_ = table empty

table__
  :: forall lock payload
   . String
  -> Domable lock payload
table__ t = table_ [ DC.text_ t ]
