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
  :: forall payload
   . Event (Attribute Title_)
  -> Array (Domable payload)
  -> Domable payload
title attributes kids = Domable
  ( Element'
      ( DC.elementify "title" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

title_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
title_ = title empty

title__
  :: forall payload
   . String
  -> Domable payload
title__ t = title_ [ DC.text_ t ]
