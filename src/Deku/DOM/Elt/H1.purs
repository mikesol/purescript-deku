module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data H1_

class H1_Ctor i o | i -> o where
  h1
    :: Event (Attribute H1_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H1_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  h1 a i = elementify "h1" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H1_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  h1 a i = elementify "h1" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H1_Ctor (Element locki payloadi) (Element locko payloado) where
  h1 a i = elementify "h1" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H1_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  h1 a i = elementify "h1" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

h1_
  :: forall i o
   . H1_Ctor i o
  => i
  -> o
h1_ = h1 empty
