module Deku.DOM.Elt.Applet where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Applet_

applet
  :: forall lock payload
   . Event (Attribute Applet_)
  -> Array (Domable lock payload)
  -> Domable lock payload
applet attributes kids = Domable (Element' (elementify "applet" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

applet_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
applet_ = applet empty

