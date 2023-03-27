module Deku.DOM.Elt.Sub where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Sub_

sub
  :: forall payload
   . Event (Attribute Sub_)
  -> Array (Domable payload)
  -> Domable payload
sub attributes kids = Domable
  ( Element'
      ( DC.elementify "sub" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

sub_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
sub_ = sub empty

sub__
  :: forall payload
   . String
  -> Domable payload
sub__ t = sub_ [ DC.text_ t ]
