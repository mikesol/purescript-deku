module Deku.DOM.Elt.H4 where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data H4_

class H4_Ctor i o | i -> o where
  h4
    :: Event (Attribute H4_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H4_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  h4 a i = elementify "h4" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H4_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  h4 a i = elementify "h4" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H4_Ctor (Element locki payloadi) (Element locko payloado) where
  h4 a i = elementify "h4" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H4_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  h4 a i = elementify "h4" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

h4_
  :: forall i o
   . H4_Ctor i o
  => i
  -> o
h4_ = h4 empty
