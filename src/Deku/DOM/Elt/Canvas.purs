module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Canvas_

class Canvas_Ctor i o | i -> o where
  canvas
    :: Event (Attribute Canvas_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Canvas_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  canvas a i = elementify "canvas" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Canvas_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  canvas a i = elementify "canvas" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Canvas_Ctor (Element locki payloadi) (Element locko payloado) where
  canvas a i = elementify "canvas" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Canvas_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  canvas a i = elementify "canvas" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

canvas_
  :: forall i o
   . Canvas_Ctor i o
  => i
  -> o
canvas_ = canvas empty
