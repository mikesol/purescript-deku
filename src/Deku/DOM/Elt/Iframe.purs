module Deku.DOM.Elt.Iframe where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Iframe_

iframe
  :: forall lock payload
   . Event (Attribute Iframe_)
  -> Array (Domable lock payload)
  -> Domable lock payload
iframe attributes kids = Domable
  ( Element'
      ( DC.elementify "iframe" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

iframe_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
iframe_ = iframe empty


iframe__
  :: forall lock payload
   . String
  -> Domable lock payload
iframe__ t = iframe_ [ DC.text_ t ]
