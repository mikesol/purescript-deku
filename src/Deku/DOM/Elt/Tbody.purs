module Deku.DOM.Elt.Tbody where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tbody_

tbody
  :: Event (Attribute Tbody_)
  -> Array Domable
  -> Domable
tbody attributes kids = Domable
  ( Element'
      ( DC.elementify "tbody" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tbody_
  :: Array Domable
  -> Domable
tbody_ = tbody empty

tbody__
  :: String
  -> Domable
tbody__ t = tbody_ [ DC.text_ t ]
