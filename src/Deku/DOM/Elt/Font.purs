module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Font_

class Font_Ctor i o | i -> o where
  font
    :: Event (Attribute Font_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Font_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  font a i = elementify "font" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Font_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  font a i = elementify "font" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Font_Ctor (Element locki payloadi) (Element locko payloado) where
  font a i = elementify "font" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Font_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  font a i = elementify "font" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

font_
  :: forall i o
   . Font_Ctor i o
  => i
  -> o
font_ = font empty
