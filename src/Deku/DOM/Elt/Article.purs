module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Article_

article
  :: forall lock payload
   . Event (Attribute Article_)
  -> Array (Domable lock payload)
  -> Domable lock payload
article attributes kids = Element' (elementify "article" attributes (FixedChildren' (FixedChildren kids)))

article_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
article_ = article empty

