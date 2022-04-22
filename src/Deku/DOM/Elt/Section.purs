module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Section_

class Section_Ctor i o | i -> o where
  section
    :: Event (Attribute Section_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Section_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  section a i = elementify "section" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Section_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  section a i = elementify "section" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Section_Ctor (Element locki payloadi) (Element locko payloado) where
  section a i = elementify "section" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Section_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  section a i = elementify "section" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

section_
  :: forall i o
   . Section_Ctor i o
  => i
  -> o
section_ = section empty
