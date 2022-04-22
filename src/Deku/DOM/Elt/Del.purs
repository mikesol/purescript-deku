module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Del_

class Del_Ctor i o | i -> o where
  del
    :: Event (Attribute Del_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Del_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  del a i = elementify "del" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Del_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  del a i = elementify "del" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Del_Ctor (Element locki payloadi) (Element locko payloado) where
  del a i = elementify "del" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Del_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  del a i = elementify "del" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

del_
  :: forall i o
   . Del_Ctor i o
  => i
  -> o
del_ = del empty
