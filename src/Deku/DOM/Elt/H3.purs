module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data H3_

class H3_Ctor i o | i -> o where
  h3
    :: Event (Attribute H3_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H3_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  h3 a i = elementify "h3" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H3_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  h3 a i = elementify "h3" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H3_Ctor (Element locki payloadi) (Element locko payloado) where
  h3 a i = elementify "h3" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H3_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  h3 a i = elementify "h3" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

h3_
  :: forall i o
   . H3_Ctor i o
  => i
  -> o
h3_ = h3 empty
