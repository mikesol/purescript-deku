module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Area_

class Area_Ctor i o | i -> o where
  area
    :: Event (Attribute Area_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Area_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  area a i = elementify "area" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Area_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  area a i = elementify "area" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Area_Ctor (Element locki payloadi) (Element locko payloado) where
  area a i = elementify "area" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Area_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  area a i = elementify "area" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

area_
  :: forall i o
   . Area_Ctor i o
  => i
  -> o
area_ = area empty
