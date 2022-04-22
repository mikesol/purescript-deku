module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Div_

class Div_Ctor i o | i -> o where
  div
    :: Event (Attribute Div_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Div_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  div a i = elementify "div" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Div_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  div a i = elementify "div" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Div_Ctor (Element locki payloadi) (Element locko payloado) where
  div a i = elementify "div" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Div_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  div a i = elementify "div" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

div_
  :: forall i o
   . Div_Ctor i o
  => i
  -> o
div_ = div empty
