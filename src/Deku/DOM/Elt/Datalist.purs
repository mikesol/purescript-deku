module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Datalist_

class Datalist_Ctor i o | i -> o where
  datalist
    :: Event (Attribute Datalist_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Datalist_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  datalist a i = elementify "datalist" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Datalist_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  datalist a i = elementify "datalist" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Datalist_Ctor (Element locki payloadi) (Element locko payloado) where
  datalist a i = elementify "datalist" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Datalist_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  datalist a i = elementify "datalist" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

datalist_
  :: forall i o
   . Datalist_Ctor i o
  => i
  -> o
datalist_ = datalist empty
