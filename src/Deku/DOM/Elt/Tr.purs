module Deku.DOM.Elt.Tr where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Tr_

class Tr_Ctor i o | i -> o where
  tr
    :: Event (Attribute Tr_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tr_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  tr a i = elementify "tr" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tr_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  tr a i = elementify "tr" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tr_Ctor (Element locki payloadi) (Element locko payloado) where
  tr a i = elementify "tr" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tr_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  tr a i = elementify "tr" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

tr_
  :: forall i o
   . Tr_Ctor i o
  => i
  -> o
tr_ = tr empty
