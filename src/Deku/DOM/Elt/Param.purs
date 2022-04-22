module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Param_

class Param_Ctor i o | i -> o where
  param
    :: Event (Attribute Param_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Param_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  param a i = elementify "param" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Param_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  param a i = elementify "param" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Param_Ctor (Element locki payloadi) (Element locko payloado) where
  param a i = elementify "param" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Param_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  param a i = elementify "param" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

param_
  :: forall i o
   . Param_Ctor i o
  => i
  -> o
param_ = param empty
