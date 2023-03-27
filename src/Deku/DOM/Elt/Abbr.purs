module Deku.DOM.Elt.Abbr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Abbr_

abbr
  :: Event (Attribute Abbr_)
  -> Array Domable
  -> Domable
abbr attributes kids = Domable
  ( Element'
      ( DC.elementify "abbr" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

abbr_
  :: Array Domable
  -> Domable
abbr_ = abbr empty

abbr__
  :: String
  -> Domable
abbr__ t = abbr_ [ DC.text_ t ]
