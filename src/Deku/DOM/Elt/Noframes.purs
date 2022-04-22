module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Noframes_

class Noframes_Ctor i o | i -> o where
  noframes
    :: Event (Attribute Noframes_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noframes_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  noframes a i = elementify "noframes" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noframes_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  noframes a i = elementify "noframes" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noframes_Ctor (Element locki payloadi) (Element locko payloado) where
  noframes a i = elementify "noframes" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noframes_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  noframes a i = elementify "noframes" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

noframes_
  :: forall i o
   . Noframes_Ctor i o
  => i
  -> o
noframes_ = noframes empty
