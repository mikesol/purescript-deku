module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Pre_

class Pre_Ctor i o | i -> o where
  pre
    :: Event (Attribute Pre_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Pre_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  pre a i = elementify "pre" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Pre_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  pre a i = elementify "pre" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Pre_Ctor (Element locki payloadi) (Element locko payloado) where
  pre a i = elementify "pre" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Pre_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  pre a i = elementify "pre" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

pre_
  :: forall i o
   . Pre_Ctor i o
  => i
  -> o
pre_ = pre empty
