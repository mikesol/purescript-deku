module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Big_

class Big_Ctor i o | i -> o where
  big
    :: Event (Attribute Big_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Big_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  big a i = elementify "big" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Big_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  big a i = elementify "big" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Big_Ctor (Element locki payloadi) (Element locko payloado) where
  big a i = elementify "big" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Big_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  big a i = elementify "big" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

big_
  :: forall i o
   . Big_Ctor i o
  => i
  -> o
big_ = big empty
