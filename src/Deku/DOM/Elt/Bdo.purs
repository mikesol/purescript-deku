module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Bdo_

class Bdo_Ctor i o | i -> o where
  bdo
    :: Event (Attribute Bdo_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdo_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  bdo a i = elementify "bdo" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdo_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  bdo a i = elementify "bdo" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdo_Ctor (Element locki payloadi) (Element locko payloado) where
  bdo a i = elementify "bdo" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Bdo_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  bdo a i = elementify "bdo" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

bdo_
  :: forall i o
   . Bdo_Ctor i o
  => i
  -> o
bdo_ = bdo empty
