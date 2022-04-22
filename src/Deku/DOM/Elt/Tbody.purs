module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Tbody_

class Tbody_Ctor i o | i -> o where
  tbody
    :: Event (Attribute Tbody_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tbody_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  tbody a i = elementify "tbody" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tbody_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  tbody a i = elementify "tbody" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tbody_Ctor (Element locki payloadi) (Element locko payloado) where
  tbody a i = elementify "tbody" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tbody_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  tbody a i = elementify "tbody" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

tbody_
  :: forall i o
   . Tbody_Ctor i o
  => i
  -> o
tbody_ = tbody empty
