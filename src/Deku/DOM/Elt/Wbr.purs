module Deku.DOM.Elt.Wbr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Wbr_

wbr
  :: Event (Attribute Wbr_)
  -> Array Domable
  -> Domable
wbr attributes kids = Domable
  ( Element'
      ( DC.elementify "wbr" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

wbr_
  :: Array Domable
  -> Domable
wbr_ = wbr empty

wbr__
  :: String
  -> Domable
wbr__ t = wbr_ [ DC.text_ t ]
