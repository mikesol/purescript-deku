module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Picture_

class Picture_Ctor i o | i -> o where
  picture
    :: Event (Attribute Picture_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Picture_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  picture a i = elementify "picture" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Picture_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  picture a i = elementify "picture" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Picture_Ctor (Element locki payloadi) (Element locko payloado) where
  picture a i = elementify "picture" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Picture_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  picture a i = elementify "picture" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

picture_
  :: forall i o
   . Picture_Ctor i o
  => i
  -> o
picture_ = picture empty
