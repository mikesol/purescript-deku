module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Ins_

ins
  :: forall lock payload
   . Event (Attribute Ins_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ins attributes kids = Domable (Element' (elementify "ins" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

ins_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ins_ = ins empty

