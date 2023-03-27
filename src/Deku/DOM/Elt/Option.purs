module Deku.DOM.Elt.Option where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Option_

option
  :: Event (Attribute Option_)
  -> Array Domable
  -> Domable
option attributes kids = Domable
  ( Element'
      ( DC.elementify "option" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

option_
  :: Array Domable
  -> Domable
option_ = option empty

option__
  :: String
  -> Domable
option__ t = option_ [ DC.text_ t ]
