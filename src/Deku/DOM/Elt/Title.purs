module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Title_

title
  :: forall lock payload
   . Event (Attribute Title_)
  -> Array (Domable lock payload)
  -> Domable lock payload
title attributes kids = Domable (Element' (elementify "title" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

title_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
title_ = title empty

