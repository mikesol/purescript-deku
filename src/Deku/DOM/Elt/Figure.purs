module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Figure_

class Figure_Ctor i o | i -> o where
  figure
    :: Event (Attribute Figure_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figure_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  figure a i = elementify "figure" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figure_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  figure a i = elementify "figure" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figure_Ctor (Element locki payloadi) (Element locko payloado) where
  figure a i = elementify "figure" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figure_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  figure a i = elementify "figure" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

figure_
  :: forall i o
   . Figure_Ctor i o
  => i
  -> o
figure_ = figure empty
