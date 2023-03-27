module Deku.DOM.Elt.Title where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Title_

title
  :: Event (Attribute Title_)
  -> Array Domable
  -> Domable
title attributes kids = Domable
  ( Element'
      ( DC.elementify "title" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

title_
  :: Array Domable
  -> Domable
title_ = title empty

title__
  :: String
  -> Domable
title__ t = title_ [ DC.text_ t ]
