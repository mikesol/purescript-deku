module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Rp_

class Rp_Ctor i o | i -> o where
  rp
    :: Event (Attribute Rp_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rp_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  rp a i = elementify "rp" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rp_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  rp a i = elementify "rp" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rp_Ctor (Element locki payloadi) (Element locko payloado) where
  rp a i = elementify "rp" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Rp_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  rp a i = elementify "rp" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

rp_
  :: forall i o
   . Rp_Ctor i o
  => i
  -> o
rp_ = rp empty
