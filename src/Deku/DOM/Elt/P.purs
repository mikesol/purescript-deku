module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data P_

class P_Ctor i o | i -> o where
  p
    :: Event (Attribute P_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  P_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  p a i = elementify "p" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  P_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  p a i = elementify "p" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  P_Ctor (Element locki payloadi) (Element locko payloado) where
  p a i = elementify "p" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  P_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  p a i = elementify "p" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

p_
  :: forall i o
   . P_Ctor i o
  => i
  -> o
p_ = p empty
