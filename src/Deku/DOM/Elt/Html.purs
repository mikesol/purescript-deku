module Deku.DOM.Elt.Html where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Html_

html
  :: Event (Attribute Html_)
  -> Array Domable
  -> Domable
html attributes kids = Domable
  ( Element'
      ( DC.elementify "html" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

html_
  :: Array Domable
  -> Domable
html_ = html empty

html__
  :: String
  -> Domable
html__ t = html_ [ DC.text_ t ]
