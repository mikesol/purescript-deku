module Deku.DOM.Elt.A where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data A_

class A_Ctor i o | i -> o where
  a
    :: Event (Attribute A_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  A_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  a a i = elementify "a" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  A_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  a a i = elementify "a" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  A_Ctor (Element locki payloadi) (Element locko payloado) where
  a a i = elementify "a" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  A_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  a a i = elementify "a" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

a_
  :: forall i o
   . A_Ctor i o
  => i
  -> o
a_ = a empty
