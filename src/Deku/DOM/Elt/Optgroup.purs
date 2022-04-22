module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Optgroup_

class Optgroup_Ctor i o | i -> o where
  optgroup
    :: Event (Attribute Optgroup_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Optgroup_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  optgroup a i = elementify "optgroup" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Optgroup_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  optgroup a i = elementify "optgroup" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Optgroup_Ctor (Element locki payloadi) (Element locko payloado) where
  optgroup a i = elementify "optgroup" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Optgroup_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  optgroup a i = elementify "optgroup" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

optgroup_
  :: forall i o
   . Optgroup_Ctor i o
  => i
  -> o
optgroup_ = optgroup empty
