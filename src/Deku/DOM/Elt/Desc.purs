module Deku.DOM.Elt.Desc where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Desc_

desc
  :: Event (Attribute Desc_)
  -> Array Domable
  -> Domable
desc attributes kids = Domable
  ( Element'
      ( DC.elementify "desc" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

desc_
  :: Array Domable
  -> Domable
desc_ = desc empty

desc__
  :: String
  -> Domable
desc__ t = desc_ [ DC.text_ t ]
