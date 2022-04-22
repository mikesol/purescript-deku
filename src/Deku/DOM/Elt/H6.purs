module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data H6_

class H6_Ctor i o | i -> o where
  h6
    :: Event (Attribute H6_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H6_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  h6 a i = elementify "h6" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H6_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  h6 a i = elementify "h6" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H6_Ctor (Element locki payloadi) (Element locko payloado) where
  h6 a i = elementify "h6" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H6_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  h6 a i = elementify "h6" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

h6_
  :: forall i o
   . H6_Ctor i o
  => i
  -> o
h6_ = h6 empty
