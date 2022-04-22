module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Q_

class Q_Ctor i o | i -> o where
  q
    :: Event (Attribute Q_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Q_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  q a i = elementify "q" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Q_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  q a i = elementify "q" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Q_Ctor (Element locki payloadi) (Element locko payloado) where
  q a i = elementify "q" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Q_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  q a i = elementify "q" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

q_
  :: forall i o
   . Q_Ctor i o
  => i
  -> o
q_ = q empty
