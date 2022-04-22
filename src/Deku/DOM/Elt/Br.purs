module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Br_

class Br_Ctor i o | i -> o where
  br
    :: Event (Attribute Br_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Br_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  br a i = elementify "br" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Br_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  br a i = elementify "br" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Br_Ctor (Element locki payloadi) (Element locko payloado) where
  br a i = elementify "br" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Br_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  br a i = elementify "br" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

br_
  :: forall i o
   . Br_Ctor i o
  => i
  -> o
br_ = br empty
