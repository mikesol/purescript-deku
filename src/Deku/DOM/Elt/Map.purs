module Deku.DOM.Elt.Map where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Map_

class Map_Ctor i o | i -> o where
  map
    :: Event (Attribute Map_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Map_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  map a i = elementify "map" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Map_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  map a i = elementify "map" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Map_Ctor (Element locki payloadi) (Element locko payloado) where
  map a i = elementify "map" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Map_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  map a i = elementify "map" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

map_
  :: forall i o
   . Map_Ctor i o
  => i
  -> o
map_ = map empty
