module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Summary_

class Summary_Ctor i o | i -> o where
  summary
    :: Event (Attribute Summary_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Summary_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  summary a i = elementify "summary" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Summary_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  summary a i = elementify "summary" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Summary_Ctor (Element locki payloadi) (Element locko payloado) where
  summary a i = elementify "summary" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Summary_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  summary a i = elementify "summary" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

summary_
  :: forall i o
   . Summary_Ctor i o
  => i
  -> o
summary_ = summary empty
