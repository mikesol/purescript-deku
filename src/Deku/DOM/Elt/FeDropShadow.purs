module Deku.DOM.Elt.FeDropShadow where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDropShadow_

feDropShadow
  :: Event (Attribute FeDropShadow_)
  -> Array Domable
  -> Domable
feDropShadow attributes kids = Domable
  ( Element'
      ( DC.elementify "feDropShadow" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDropShadow_
  :: Array Domable
  -> Domable
feDropShadow_ = feDropShadow empty

feDropShadow__
  :: String
  -> Domable
feDropShadow__ t = feDropShadow_ [ DC.text_ t ]
