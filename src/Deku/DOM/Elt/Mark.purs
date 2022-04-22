module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Mark_

class Mark_Ctor i o | i -> o where
  mark
    :: Event (Attribute Mark_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Mark_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  mark a i = elementify "mark" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Mark_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  mark a i = elementify "mark" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Mark_Ctor (Element locki payloadi) (Element locko payloado) where
  mark a i = elementify "mark" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Mark_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  mark a i = elementify "mark" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

mark_
  :: forall i o
   . Mark_Ctor i o
  => i
  -> o
mark_ = mark empty
