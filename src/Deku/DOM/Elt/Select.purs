module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Select_

class Select_Ctor i o | i -> o where
  select
    :: Event (Attribute Select_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Select_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  select a i = elementify "select" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Select_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  select a i = elementify "select" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Select_Ctor (Element locki payloadi) (Element locko payloado) where
  select a i = elementify "select" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Select_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  select a i = elementify "select" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

select_
  :: forall i o
   . Select_Ctor i o
  => i
  -> o
select_ = select empty
