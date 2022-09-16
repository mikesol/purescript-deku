module Deku.DOM.Elt.Html where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Html_

html
  :: forall lock payload
   . Event (Attribute Html_)
  -> Array (Domable lock payload)
  -> Domable lock payload
html attributes kids = Domable (Element' (elementify "html" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

html_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
html_ = html empty

