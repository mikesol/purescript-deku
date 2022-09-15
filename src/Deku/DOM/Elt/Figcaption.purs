module Deku.DOM.Elt.Figcaption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Figcaption_

figcaption
  :: forall lock payload
   . Event (Attribute Figcaption_)
  -> Array (Domable lock payload)
  -> Domable lock payload
figcaption attributes kids = Domable (Element' (elementify "figcaption" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

figcaption_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
figcaption_ = figcaption empty

