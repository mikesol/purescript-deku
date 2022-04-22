module Deku.DOM.Elt.Sub where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Sub_

class Sub_Ctor i o | i -> o where
  sub
    :: Event (Attribute Sub_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sub_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  sub a i = elementify "sub" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sub_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  sub a i = elementify "sub" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sub_Ctor (Element locki payloadi) (Element locko payloado) where
  sub a i = elementify "sub" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Sub_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  sub a i = elementify "sub" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

sub_
  :: forall i o
   . Sub_Ctor i o
  => i
  -> o
sub_ = sub empty
