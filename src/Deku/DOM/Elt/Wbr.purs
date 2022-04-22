module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Wbr_

class Wbr_Ctor i o | i -> o where
  wbr
    :: Event (Attribute Wbr_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Wbr_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  wbr a i = elementify "wbr" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Wbr_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  wbr a i = elementify "wbr" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Wbr_Ctor (Element locki payloadi) (Element locko payloado) where
  wbr a i = elementify "wbr" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Wbr_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  wbr a i = elementify "wbr" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

wbr_
  :: forall i o
   . Wbr_Ctor i o
  => i
  -> o
wbr_ = wbr empty
