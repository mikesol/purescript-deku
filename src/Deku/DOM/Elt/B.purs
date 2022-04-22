module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data B_

class B_Ctor i o | i -> o where
  b
    :: Event (Attribute B_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  B_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  b a i = elementify "b" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  B_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  b a i = elementify "b" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  B_Ctor (Element locki payloadi) (Element locko payloado) where
  b a i = elementify "b" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  B_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  b a i = elementify "b" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

b_
  :: forall i o
   . B_Ctor i o
  => i
  -> o
b_ = b empty
