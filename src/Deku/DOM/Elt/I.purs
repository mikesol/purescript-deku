module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data I_

class I_Ctor i o | i -> o where
  i
    :: Event (Attribute I_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  I_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  i a i = elementify "i" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  I_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  i a i = elementify "i" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  I_Ctor (Element locki payloadi) (Element locko payloado) where
  i a i = elementify "i" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  I_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  i a i = elementify "i" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

i_
  :: forall i o
   . I_Ctor i o
  => i
  -> o
i_ = i empty
