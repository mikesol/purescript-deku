module Deku.DOM.Elt.Text where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Text_

text
  :: Event (Attribute Text_)
  -> Array Domable
  -> Domable
text attributes kids = Domable
  ( Element'
      ( DC.elementify "text" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

text_
  :: Array Domable
  -> Domable
text_ = text empty

text__
  :: String
  -> Domable
text__ t = text_ [ DC.text_ t ]
