module Deku.DOM.Elt.Tr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tr_

tr
  :: Event (Attribute Tr_)
  -> Array Domable
  -> Domable
tr attributes kids = Domable
  ( Element'
      ( DC.elementify "tr" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tr_
  :: Array Domable
  -> Domable
tr_ = tr empty

tr__
  :: String
  -> Domable
tr__ t = tr_ [ DC.text_ t ]
