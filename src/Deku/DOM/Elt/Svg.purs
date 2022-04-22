module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Svg_

class Svg_Ctor i o | i -> o where
  svg
    :: Event (Attribute Svg_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Svg_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  svg a i = elementify "svg" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Svg_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  svg a i = elementify "svg" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Svg_Ctor (Element locki payloadi) (Element locko payloado) where
  svg a i = elementify "svg" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Svg_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  svg a i = elementify "svg" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

svg_
  :: forall i o
   . Svg_Ctor i o
  => i
  -> o
svg_ = svg empty
