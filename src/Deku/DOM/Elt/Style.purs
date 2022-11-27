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
  :: forall lock payload
   . Event (Attribute Style_)
  -> Array (Domable lock payload)
  -> Domable lock payload
style attributes kids = Domable
  ( Element'
      ( DC.elementify "style" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

style_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
style_ = style empty

style__
  :: forall lock payload
   . String
  -> Domable lock payload
style__ t = style_ [ DC.text_ t ]
