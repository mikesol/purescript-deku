module Deku.DOM.Elt.Basefont where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Basefont_

basefont
  :: Event (Attribute Basefont_)
  -> Array Domable
  -> Domable
basefont attributes kids = Domable
  ( Element'
      ( DC.elementify "basefont" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

basefont_
  :: Array Domable
  -> Domable
basefont_ = basefont empty

basefont__
  :: String
  -> Domable
basefont__ t = basefont_ [ DC.text_ t ]
