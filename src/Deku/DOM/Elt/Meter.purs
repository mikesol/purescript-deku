module Deku.DOM.Elt.Meter where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Meter_

class Meter_Ctor i o | i -> o where
  meter
    :: Event (Attribute Meter_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meter_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  meter a i = elementify "meter" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meter_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  meter a i = elementify "meter" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meter_Ctor (Element locki payloadi) (Element locko payloado) where
  meter a i = elementify "meter" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meter_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  meter a i = elementify "meter" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

meter_
  :: forall i o
   . Meter_Ctor i o
  => i
  -> o
meter_ = meter empty
