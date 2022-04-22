module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Fieldset_

class Fieldset_Ctor i o | i -> o where
  fieldset
    :: Event (Attribute Fieldset_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Fieldset_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  fieldset a i = elementify "fieldset" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Fieldset_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  fieldset a i = elementify "fieldset" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Fieldset_Ctor (Element locki payloadi) (Element locko payloado) where
  fieldset a i = elementify "fieldset" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Fieldset_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  fieldset a i = elementify "fieldset" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

fieldset_
  :: forall i o
   . Fieldset_Ctor i o
  => i
  -> o
fieldset_ = fieldset empty
