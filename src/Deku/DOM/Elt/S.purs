module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data S_

class S_Ctor i o | i -> o where
  s
    :: Event (Attribute S_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  S_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  s a i = elementify "s" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  S_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  s a i = elementify "s" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  S_Ctor (Element locki payloadi) (Element locko payloado) where
  s a i = elementify "s" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  S_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  s a i = elementify "s" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

s_
  :: forall i o
   . S_Ctor i o
  => i
  -> o
s_ = s empty
