module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Output_

class Output_Ctor i o | i -> o where
  output
    :: Event (Attribute Output_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Output_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  output a i = elementify "output" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Output_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  output a i = elementify "output" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Output_Ctor (Element locki payloadi) (Element locko payloado) where
  output a i = elementify "output" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Output_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  output a i = elementify "output" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

output_
  :: forall i o
   . Output_Ctor i o
  => i
  -> o
output_ = output empty
