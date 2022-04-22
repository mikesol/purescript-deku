module Deku.DOM.Elt.Time where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Time_

class Time_Ctor i o | i -> o where
  time
    :: Event (Attribute Time_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Time_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  time a i = elementify "time" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Time_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  time a i = elementify "time" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Time_Ctor (Element locki payloadi) (Element locko payloado) where
  time a i = elementify "time" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Time_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  time a i = elementify "time" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

time_
  :: forall i o
   . Time_Ctor i o
  => i
  -> o
time_ = time empty
