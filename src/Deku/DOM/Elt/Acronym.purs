module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Acronym_

class Acronym_Ctor i o | i -> o where
  acronym
    :: Event (Attribute Acronym_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Acronym_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  acronym a i = elementify "acronym" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Acronym_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  acronym a i = elementify "acronym" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Acronym_Ctor (Element locki payloadi) (Element locko payloado) where
  acronym a i = elementify "acronym" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Acronym_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  acronym a i = elementify "acronym" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

acronym_
  :: forall i o
   . Acronym_Ctor i o
  => i
  -> o
acronym_ = acronym empty
