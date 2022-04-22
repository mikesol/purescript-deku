module Deku.DOM.Elt.Object where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Object_

class Object_Ctor i o | i -> o where
  object
    :: Event (Attribute Object_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Object_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  object a i = elementify "object" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Object_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  object a i = elementify "object" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Object_Ctor (Element locki payloadi) (Element locko payloado) where
  object a i = elementify "object" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Object_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  object a i = elementify "object" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

object_
  :: forall i o
   . Object_Ctor i o
  => i
  -> o
object_ = object empty
