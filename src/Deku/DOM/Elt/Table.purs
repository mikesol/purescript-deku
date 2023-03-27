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
  :: Event (Attribute Table_)
  -> Array Domable
  -> Domable
table attributes kids = Domable
  ( Element'
      ( DC.elementify "table" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

table_
  :: Array Domable
  -> Domable
table_ = table empty

table__
  :: String
  -> Domable
table__ t = table_ [ DC.text_ t ]
