module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Button_

class Button_Ctor i o | i -> o where
  button
    :: Event (Attribute Button_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Button_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  button a i = elementify "button" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Button_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  button a i = elementify "button" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Button_Ctor (Element locki payloadi) (Element locko payloado) where
  button a i = elementify "button" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Button_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  button a i = elementify "button" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

button_
  :: forall i o
   . Button_Ctor i o
  => i
  -> o
button_ = button empty
