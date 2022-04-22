module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Code_

class Code_Ctor i o | i -> o where
  code
    :: Event (Attribute Code_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Code_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  code a i = elementify "code" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Code_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  code a i = elementify "code" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Code_Ctor (Element locki payloadi) (Element locko payloado) where
  code a i = elementify "code" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Code_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  code a i = elementify "code" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

code_
  :: forall i o
   . Code_Ctor i o
  => i
  -> o
code_ = code empty
