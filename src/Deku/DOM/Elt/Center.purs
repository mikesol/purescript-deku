module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Center_

class Center_Ctor i o | i -> o where
  center
    :: Event (Attribute Center_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Center_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  center a i = elementify "center" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Center_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  center a i = elementify "center" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Center_Ctor (Element locki payloadi) (Element locko payloado) where
  center a i = elementify "center" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Center_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  center a i = elementify "center" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

center_
  :: forall i o
   . Center_Ctor i o
  => i
  -> o
center_ = center empty
