module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Textarea_

class Textarea_Ctor i o | i -> o where
  textarea
    :: Event (Attribute Textarea_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Textarea_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  textarea a i = elementify "textarea" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Textarea_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  textarea a i = elementify "textarea" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Textarea_Ctor (Element locki payloadi) (Element locko payloado) where
  textarea a i = elementify "textarea" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Textarea_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  textarea a i = elementify "textarea" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

textarea_
  :: forall i o
   . Textarea_Ctor i o
  => i
  -> o
textarea_ = textarea empty
