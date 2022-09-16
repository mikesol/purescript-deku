module Deku.DOM.Elt.Article where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Article_

article
  :: forall lock payload
   . Event (Attribute Article_)
  -> Array (Domable lock payload)
  -> Domable lock payload
article attributes kids = Domable (Element' (elementify "article" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce (mapWithIndex unsafeSetPos kids))))))

article_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
article_ = article empty

