module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Bdi_

class Bdi_Ctor i o | i -> o where
  bdi
    :: Event (Attribute Bdi_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdi_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  bdi a i = elementify "bdi" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdi_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  bdi a i = elementify "bdi" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdi_Ctor (Element locki payloadi) (Element locko payloado) where
  bdi a i = elementify "bdi" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdi_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  bdi a i = elementify "bdi" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

bdi_
  :: forall i o
   . Bdi_Ctor i o
  => i
  -> o
bdi_ = bdi empty
