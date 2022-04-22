module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Col_

class Col_Ctor i o | i -> o where
  col
    :: Event (Attribute Col_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Col_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  col a i = elementify "col" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Col_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  col a i = elementify "col" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Col_Ctor (Element locki payloadi) (Element locko payloado) where
  col a i = elementify "col" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Col_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  col a i = elementify "col" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

col_
  :: forall i o
   . Col_Ctor i o
  => i
  -> o
col_ = col empty
