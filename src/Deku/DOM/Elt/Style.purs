module Deku.DOM.Elt.Style where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Style_

style
  :: Event (Attribute Style_)
  -> Array Domable
  -> Domable
style attributes kids = Domable
  ( Element'
      ( DC.elementify "style" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

style_
  :: Array Domable
  -> Domable
style_ = style empty

style__
  :: String
  -> Domable
style__ t = style_ [ DC.text_ t ]
