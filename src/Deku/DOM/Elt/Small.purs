module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Small_

class Small_Ctor i o | i -> o where
  small
    :: Event (Attribute Small_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Small_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  small a i = elementify "small" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Small_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  small a i = elementify "small" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Small_Ctor (Element locki payloadi) (Element locko payloado) where
  small a i = elementify "small" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Small_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  small a i = elementify "small" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

small_
  :: forall i o
   . Small_Ctor i o
  => i
  -> o
small_ = small empty
