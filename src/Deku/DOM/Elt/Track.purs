module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Track_

class Track_Ctor i o | i -> o where
  track
    :: Event (Attribute Track_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Track_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  track a i = elementify "track" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Track_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  track a i = elementify "track" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Track_Ctor (Element locki payloadi) (Element locko payloado) where
  track a i = elementify "track" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Track_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  track a i = elementify "track" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

track_
  :: forall i o
   . Track_Ctor i o
  => i
  -> o
track_ = track empty
