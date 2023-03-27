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
  :: forall payload
   . Event (Attribute Style_)
  -> Array (Domable payload)
  -> Domable payload
style attributes kids = Domable
  ( Element'
      ( DC.elementify "style" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

style_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
style_ = style empty

style__
  :: forall payload
   . String
  -> Domable payload
style__ t = style_ [ DC.text_ t ]
