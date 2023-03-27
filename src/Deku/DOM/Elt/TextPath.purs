module Deku.DOM.Elt.TextPath where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data TextPath_

textPath
  :: Event (Attribute TextPath_)
  -> Array Domable
  -> Domable
textPath attributes kids = Domable
  ( Element'
      ( DC.elementify "textPath" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

textPath_
  :: Array Domable
  -> Domable
textPath_ = textPath empty

textPath__
  :: String
  -> Domable
textPath__ t = textPath_ [ DC.text_ t ]
