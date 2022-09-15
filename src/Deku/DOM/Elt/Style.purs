module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Style_

style
  :: forall lock payload
   . Event (Attribute Style_)
  -> Array (Domable lock payload)
  -> Domable lock payload
style attributes kids = Domable (Element' (elementify "style" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

style_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
style_ = style empty

