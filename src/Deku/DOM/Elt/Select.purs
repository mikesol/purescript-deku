module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Select_

select
  :: forall lock payload
   . AnEvent Zora (Attribute Select_)
  -> Array (Domable lock payload)
  -> Domable lock payload
select attributes kids = Element' (elementify "select" attributes (fixed kids))

select_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
select_ = select empty

