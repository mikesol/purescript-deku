module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Aside_

class Aside_Ctor i o | i -> o where
  aside
    :: Event (Attribute Aside_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Aside_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  aside a i = elementify "aside" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Aside_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  aside a i = elementify "aside" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Aside_Ctor (Element locki payloadi) (Element locko payloado) where
  aside a i = elementify "aside" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Aside_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  aside a i = elementify "aside" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

aside_
  :: forall i o
   . Aside_Ctor i o
  => i
  -> o
aside_ = aside empty
