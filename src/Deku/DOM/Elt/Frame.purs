module Deku.DOM.Elt.Frame where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Frame_

class Frame_Ctor i o | i -> o where
  frame
    :: Event (Attribute Frame_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frame_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  frame a i = elementify "frame" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frame_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  frame a i = elementify "frame" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frame_Ctor (Element locki payloadi) (Element locko payloado) where
  frame a i = elementify "frame" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frame_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  frame a i = elementify "frame" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

frame_
  :: forall i o
   . Frame_Ctor i o
  => i
  -> o
frame_ = frame empty
