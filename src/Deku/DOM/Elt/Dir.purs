module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Dir_

class Dir_Ctor i o | i -> o where
  dir
    :: Event (Attribute Dir_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dir_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  dir a i = elementify "dir" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dir_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  dir a i = elementify "dir" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dir_Ctor (Element locki payloadi) (Element locko payloado) where
  dir a i = elementify "dir" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dir_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  dir a i = elementify "dir" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

dir_
  :: forall i o
   . Dir_Ctor i o
  => i
  -> o
dir_ = dir empty
