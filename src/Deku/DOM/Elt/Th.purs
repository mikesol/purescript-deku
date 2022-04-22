module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Th_

class Th_Ctor i o | i -> o where
  th
    :: Event (Attribute Th_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Th_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  th a i = elementify "th" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Th_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  th a i = elementify "th" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Th_Ctor (Element locki payloadi) (Element locko payloado) where
  th a i = elementify "th" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Th_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  th a i = elementify "th" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

th_
  :: forall i o
   . Th_Ctor i o
  => i
  -> o
th_ = th empty
