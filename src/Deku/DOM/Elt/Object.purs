module Deku.DOM.Elt.Object where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Object_

object
  :: forall payload
   . Event (Attribute Object_)
  -> Array (Domable payload)
  -> Domable payload
object attributes kids = Domable
  ( Element'
      ( DC.elementify "object" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

object_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
object_ = object empty

object__
  :: forall payload
   . String
  -> Domable payload
object__ t = object_ [ DC.text_ t ]
