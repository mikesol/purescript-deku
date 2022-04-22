module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Strike_

class Strike_Ctor i o | i -> o where
  strike
    :: Event (Attribute Strike_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strike_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  strike a i = elementify "strike" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strike_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  strike a i = elementify "strike" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strike_Ctor (Element locki payloadi) (Element locko payloado) where
  strike a i = elementify "strike" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strike_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  strike a i = elementify "strike" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

strike_
  :: forall i o
   . Strike_Ctor i o
  => i
  -> o
strike_ = strike empty
