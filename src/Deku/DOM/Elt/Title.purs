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
  :: forall lock payload
   . Event (Attribute Title_)
  -> Array (Domable lock payload)
  -> Domable lock payload
title attributes kids = Domable
  ( Element'
      ( DC.elementify "title" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

title_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
title_ = title empty

title__
  :: forall lock payload
   . String
  -> Domable lock payload
title__ t = title_ [ DC.text_ t ]
