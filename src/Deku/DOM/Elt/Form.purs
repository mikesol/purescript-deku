module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Form_

class Form_Ctor i o | i -> o where
  form
    :: Event (Attribute Form_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Form_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  form a i = elementify "form" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Form_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  form a i = elementify "form" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Form_Ctor (Element locki payloadi) (Element locko payloado) where
  form a i = elementify "form" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Form_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  form a i = elementify "form" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

form_
  :: forall i o
   . Form_Ctor i o
  => i
  -> o
form_ = form empty
