module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Dt_

class Dt_Ctor i o | i -> o where
  dt
    :: Event (Attribute Dt_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dt_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  dt a i = elementify "dt" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dt_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  dt a i = elementify "dt" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dt_Ctor (Element locki payloadi) (Element locko payloado) where
  dt a i = elementify "dt" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dt_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  dt a i = elementify "dt" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

dt_
  :: forall i o
   . Dt_Ctor i o
  => i
  -> o
dt_ = dt empty
