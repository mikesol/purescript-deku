module Deku.DOM.Elt.Caption where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Caption_

caption
  :: Event (Attribute Caption_)
  -> Array Domable
  -> Domable
caption attributes kids = Domable
  ( Element'
      ( DC.elementify "caption" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

caption_
  :: Array Domable
  -> Domable
caption_ = caption empty

caption__
  :: String
  -> Domable
caption__ t = caption_ [ DC.text_ t ]
