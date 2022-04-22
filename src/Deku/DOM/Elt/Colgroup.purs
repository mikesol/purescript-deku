module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Colgroup_

class Colgroup_Ctor i o | i -> o where
  colgroup
    :: Event (Attribute Colgroup_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Colgroup_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  colgroup a i = elementify "colgroup" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Colgroup_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  colgroup a i = elementify "colgroup" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Colgroup_Ctor (Element locki payloadi) (Element locko payloado) where
  colgroup a i = elementify "colgroup" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Colgroup_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  colgroup a i = elementify "colgroup" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

colgroup_
  :: forall i o
   . Colgroup_Ctor i o
  => i
  -> o
colgroup_ = colgroup empty
