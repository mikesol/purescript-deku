module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Kbd_

class Kbd_Ctor i o | i -> o where
  kbd
    :: Event (Attribute Kbd_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Kbd_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  kbd a i = elementify "kbd" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Kbd_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  kbd a i = elementify "kbd" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Kbd_Ctor (Element locki payloadi) (Element locko payloado) where
  kbd a i = elementify "kbd" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Kbd_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  kbd a i = elementify "kbd" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

kbd_
  :: forall i o
   . Kbd_Ctor i o
  => i
  -> o
kbd_ = kbd empty
