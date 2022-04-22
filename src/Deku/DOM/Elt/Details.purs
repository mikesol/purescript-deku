module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Details_

class Details_Ctor i o | i -> o where
  details
    :: Event (Attribute Details_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Details_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  details a i = elementify "details" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Details_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  details a i = elementify "details" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Details_Ctor (Element locki payloadi) (Element locko payloado) where
  details a i = elementify "details" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Details_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  details a i = elementify "details" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

details_
  :: forall i o
   . Details_Ctor i o
  => i
  -> o
details_ = details empty
