module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Td_

class Td_Ctor i o | i -> o where
  td
    :: Event (Attribute Td_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Td_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  td a i = elementify "td" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Td_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  td a i = elementify "td" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Td_Ctor (Element locki payloadi) (Element locko payloado) where
  td a i = elementify "td" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Td_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  td a i = elementify "td" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

td_
  :: forall i o
   . Td_Ctor i o
  => i
  -> o
td_ = td empty
