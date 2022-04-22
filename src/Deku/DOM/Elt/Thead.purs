module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Thead_

class Thead_Ctor i o | i -> o where
  thead
    :: Event (Attribute Thead_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Thead_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  thead a i = elementify "thead" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Thead_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  thead a i = elementify "thead" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Thead_Ctor (Element locki payloadi) (Element locko payloado) where
  thead a i = elementify "thead" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Thead_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  thead a i = elementify "thead" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

thead_
  :: forall i o
   . Thead_Ctor i o
  => i
  -> o
thead_ = thead empty
