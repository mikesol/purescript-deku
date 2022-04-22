module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Img_

class Img_Ctor i o | i -> o where
  img
    :: Event (Attribute Img_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Img_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  img a i = elementify "img" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Img_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  img a i = elementify "img" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Img_Ctor (Element locki payloadi) (Element locko payloado) where
  img a i = elementify "img" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Img_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  img a i = elementify "img" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

img_
  :: forall i o
   . Img_Ctor i o
  => i
  -> o
img_ = img empty
