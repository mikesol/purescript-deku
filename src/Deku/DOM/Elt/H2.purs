module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data H2_

class H2_Ctor i o | i -> o where
  h2
    :: Event (Attribute H2_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H2_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  h2 a i = elementify "h2" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H2_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  h2 a i = elementify "h2" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H2_Ctor (Element locki payloadi) (Element locko payloado) where
  h2 a i = elementify "h2" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H2_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  h2 a i = elementify "h2" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

h2_
  :: forall i o
   . H2_Ctor i o
  => i
  -> o
h2_ = h2 empty
