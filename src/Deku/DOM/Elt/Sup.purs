module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Sup_

class Sup_Ctor i o | i -> o where
  sup
    :: Event (Attribute Sup_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sup_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  sup a i = elementify "sup" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sup_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  sup a i = elementify "sup" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sup_Ctor (Element locki payloadi) (Element locko payloado) where
  sup a i = elementify "sup" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sup_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  sup a i = elementify "sup" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

sup_
  :: forall i o
   . Sup_Ctor i o
  => i
  -> o
sup_ = sup empty
