module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Style_

class Style_Ctor i o | i -> o where
  style
    :: Event (Attribute Style_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Style_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  style a i = elementify "style" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Style_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  style a i = elementify "style" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Style_Ctor (Element locki payloadi) (Element locko payloado) where
  style a i = elementify "style" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Style_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  style a i = elementify "style" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

style_
  :: forall i o
   . Style_Ctor i o
  => i
  -> o
style_ = style empty
