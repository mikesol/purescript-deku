module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Iframe_

iframe
  :: forall lock payload
   . Event (Attribute Iframe_)
  -> Array (Domable lock payload)
  -> Domable lock payload
iframe attributes kids = Domable (Element' (elementify "iframe" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

iframe_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
iframe_ = iframe empty

