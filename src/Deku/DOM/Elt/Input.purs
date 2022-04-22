module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Input_

class Input_Ctor i o | i -> o where
  input
    :: Event (Attribute Input_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Input_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  input a i = elementify "input" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Input_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  input a i = elementify "input" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Input_Ctor (Element locki payloadi) (Element locko payloado) where
  input a i = elementify "input" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Input_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  input a i = elementify "input" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

input_
  :: forall i o
   . Input_Ctor i o
  => i
  -> o
input_ = input empty
