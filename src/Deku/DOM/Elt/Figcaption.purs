module Deku.DOM.Elt.Figcaption where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Figcaption_

figcaption
  :: forall lock payload
   . Event (Attribute Figcaption_)
  -> Array (Domable lock payload)
  -> Domable lock payload
figcaption attributes kids = Domable
  ( Element'
      ( DC.elementify "figcaption" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

figcaption_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
figcaption_ = figcaption empty

figcaption__
  :: forall lock payload
   . String
  -> Domable lock payload
figcaption__ t = figcaption_ [ DC.text_ t ]
