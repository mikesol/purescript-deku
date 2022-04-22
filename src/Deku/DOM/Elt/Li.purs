module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Li_

class Li_Ctor i o | i -> o where
  li
    :: Event (Attribute Li_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Li_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  li a i = elementify "li" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Li_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  li a i = elementify "li" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Li_Ctor (Element locki payloadi) (Element locko payloado) where
  li a i = elementify "li" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Li_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  li a i = elementify "li" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

li_
  :: forall i o
   . Li_Ctor i o
  => i
  -> o
li_ = li empty
