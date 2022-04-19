module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Fieldset_

fieldset
  :: forall event payload
   . IsEvent event
  => event (Attribute Fieldset_)
  -> Array (Element event payload)
  -> Element event payload
fieldset = elementify "fieldset"

fieldset_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
fieldset_ = fieldset empty
