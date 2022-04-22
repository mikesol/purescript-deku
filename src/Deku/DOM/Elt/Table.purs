module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Table_

class Table_Ctor i o | i -> o where
  table
    :: Event (Attribute Table_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Table_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  table a i = elementify "table" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Table_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  table a i = elementify "table" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Table_Ctor (Element locki payloadi) (Element locko payloado) where
  table a i = elementify "table" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Table_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  table a i = elementify "table" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

table_
  :: forall i o
   . Table_Ctor i o
  => i
  -> o
table_ = table empty
