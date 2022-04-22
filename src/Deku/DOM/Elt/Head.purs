module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Head_

class Head_Ctor i o | i -> o where
  head
    :: Event (Attribute Head_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Head_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  head a i = elementify "head" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Head_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  head a i = elementify "head" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Head_Ctor (Element locki payloadi) (Element locko payloado) where
  head a i = elementify "head" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Head_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  head a i = elementify "head" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

head_
  :: forall i o
   . Head_Ctor i o
  => i
  -> o
head_ = head empty
