module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Legend_

class Legend_Ctor i o | i -> o where
  legend
    :: Event (Attribute Legend_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Legend_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  legend a i = elementify "legend" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Legend_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  legend a i = elementify "legend" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Legend_Ctor (Element locki payloadi) (Element locko payloado) where
  legend a i = elementify "legend" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Legend_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  legend a i = elementify "legend" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

legend_
  :: forall i o
   . Legend_Ctor i o
  => i
  -> o
legend_ = legend empty
