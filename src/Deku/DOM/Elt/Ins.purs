module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Ins_

class Ins_Ctor i o | i -> o where
  ins
    :: Event (Attribute Ins_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ins_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  ins a i = elementify "ins" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ins_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  ins a i = elementify "ins" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ins_Ctor (Element locki payloadi) (Element locko payloado) where
  ins a i = elementify "ins" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ins_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  ins a i = elementify "ins" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

ins_
  :: forall i o
   . Ins_Ctor i o
  => i
  -> o
ins_ = ins empty
