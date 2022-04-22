module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Rt_

class Rt_Ctor i o | i -> o where
  rt
    :: Event (Attribute Rt_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rt_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  rt a i = elementify "rt" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rt_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  rt a i = elementify "rt" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rt_Ctor (Element locki payloadi) (Element locko payloado) where
  rt a i = elementify "rt" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rt_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  rt a i = elementify "rt" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

rt_
  :: forall i o
   . Rt_Ctor i o
  => i
  -> o
rt_ = rt empty
