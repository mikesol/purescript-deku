module Deku.DOM.Elt.Strong where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Strong_

class Strong_Ctor i o | i -> o where
  strong
    :: Event (Attribute Strong_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strong_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  strong a i = elementify "strong" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strong_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  strong a i = elementify "strong" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strong_Ctor (Element locki payloadi) (Element locko payloado) where
  strong a i = elementify "strong" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Strong_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  strong a i = elementify "strong" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

strong_
  :: forall i o
   . Strong_Ctor i o
  => i
  -> o
strong_ = strong empty
