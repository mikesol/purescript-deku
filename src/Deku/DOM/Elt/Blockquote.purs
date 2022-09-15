module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Blockquote_

blockquote
  :: forall lock payload
   . Event (Attribute Blockquote_)
  -> Array (Domable lock payload)
  -> Domable lock payload
blockquote attributes kids = Domable (Element' (elementify "blockquote" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

blockquote_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
blockquote_ = blockquote empty

