module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Var_

class Var_Ctor i o | i -> o where
  var
    :: Event (Attribute Var_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Var_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  var a i = elementify "var" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Var_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  var a i = elementify "var" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Var_Ctor (Element locki payloadi) (Element locko payloado) where
  var a i = elementify "var" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Var_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  var a i = elementify "var" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

var_
  :: forall i o
   . Var_Ctor i o
  => i
  -> o
var_ = var empty
