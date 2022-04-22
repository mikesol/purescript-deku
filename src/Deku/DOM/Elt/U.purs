module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data U_

class U_Ctor i o | i -> o where
  u
    :: Event (Attribute U_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  U_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  u a i = elementify "u" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  U_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  u a i = elementify "u" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  U_Ctor (Element locki payloadi) (Element locko payloado) where
  u a i = elementify "u" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  U_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  u a i = elementify "u" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

u_
  :: forall i o
   . U_Ctor i o
  => i
  -> o
u_ = u empty
