module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Fieldset_

fieldset
  :: Event (Attribute Fieldset_)
  -> Array Domable
  -> Domable
fieldset = DC.elementify2 "fieldset"

fieldset_
  :: Array Domable
  -> Domable
fieldset_ = fieldset empty

fieldset__
  :: String
  -> Domable
fieldset__ t = fieldset_ [ DC.text_ t ]
