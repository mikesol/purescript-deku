module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Div_

div
  :: forall lock payload
   . Event (Attribute Div_)
  -> Array (Domable lock payload)
  -> Domable lock payload
div attributes kids = Domable (Element' (elementify "div" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

div_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
div_ = div empty

