module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Meta_

class Meta_Ctor i o | i -> o where
  meta
    :: Event (Attribute Meta_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meta_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  meta a i = elementify "meta" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meta_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  meta a i = elementify "meta" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meta_Ctor (Element locki payloadi) (Element locko payloado) where
  meta a i = elementify "meta" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Meta_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  meta a i = elementify "meta" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

meta_
  :: forall i o
   . Meta_Ctor i o
  => i
  -> o
meta_ = meta empty
