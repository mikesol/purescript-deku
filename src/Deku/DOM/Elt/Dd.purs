module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Dd_

class Dd_Ctor i o | i -> o where
  dd
    :: Event (Attribute Dd_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dd_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  dd a i = elementify "dd" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dd_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  dd a i = elementify "dd" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dd_Ctor (Element locki payloadi) (Element locko payloado) where
  dd a i = elementify "dd" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dd_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  dd a i = elementify "dd" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

dd_
  :: forall i o
   . Dd_Ctor i o
  => i
  -> o
dd_ = dd empty
