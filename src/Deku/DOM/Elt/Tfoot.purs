module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Tfoot_

class Tfoot_Ctor i o | i -> o where
  tfoot
    :: Event (Attribute Tfoot_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tfoot_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  tfoot a i = elementify "tfoot" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tfoot_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  tfoot a i = elementify "tfoot" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tfoot_Ctor (Element locki payloadi) (Element locko payloado) where
  tfoot a i = elementify "tfoot" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tfoot_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  tfoot a i = elementify "tfoot" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

tfoot_
  :: forall i o
   . Tfoot_Ctor i o
  => i
  -> o
tfoot_ = tfoot empty
