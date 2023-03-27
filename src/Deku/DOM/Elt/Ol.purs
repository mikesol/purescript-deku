module Deku.DOM.Elt.Ol where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ol_

ol
  :: Event (Attribute Ol_)
  -> Array Domable
  -> Domable
ol attributes kids = Domable
  ( Element'
      ( DC.elementify "ol" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ol_
  :: Array Domable
  -> Domable
ol_ = ol empty

ol__
  :: String
  -> Domable
ol__ t = ol_ [ DC.text_ t ]
