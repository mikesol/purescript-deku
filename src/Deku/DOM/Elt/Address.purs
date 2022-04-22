module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Address_

class Address_Ctor i o | i -> o where
  address
    :: Event (Attribute Address_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Address_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  address a i = elementify "address" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Address_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  address a i = elementify "address" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Address_Ctor (Element locki payloadi) (Element locko payloado) where
  address a i = elementify "address" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Address_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  address a i = elementify "address" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

address_
  :: forall i o
   . Address_Ctor i o
  => i
  -> o
address_ = address empty
