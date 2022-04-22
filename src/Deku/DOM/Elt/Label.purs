module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Label_

class Label_Ctor i o | i -> o where
  label
    :: Event (Attribute Label_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Label_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  label a i = elementify "label" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Label_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  label a i = elementify "label" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Label_Ctor (Element locki payloadi) (Element locko payloado) where
  label a i = elementify "label" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Label_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  label a i = elementify "label" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

label_
  :: forall i o
   . Label_Ctor i o
  => i
  -> o
label_ = label empty
