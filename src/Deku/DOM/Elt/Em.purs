module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Em_

class Em_Ctor i o | i -> o where
  em
    :: Event (Attribute Em_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Em_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  em a i = elementify "em" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Em_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  em a i = elementify "em" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Em_Ctor (Element locki payloadi) (Element locko payloado) where
  em a i = elementify "em" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Em_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  em a i = elementify "em" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

em_
  :: forall i o
   . Em_Ctor i o
  => i
  -> o
em_ = em empty
