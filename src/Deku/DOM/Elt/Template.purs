module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Template_

class Template_Ctor i o | i -> o where
  template
    :: Event (Attribute Template_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Template_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  template a i = elementify "template" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Template_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  template a i = elementify "template" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Template_Ctor (Element locki payloadi) (Element locko payloado) where
  template a i = elementify "template" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Template_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  template a i = elementify "template" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

template_
  :: forall i o
   . Template_Ctor i o
  => i
  -> o
template_ = template empty
