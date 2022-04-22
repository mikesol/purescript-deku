module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Base_

class Base_Ctor i o | i -> o where
  base
    :: Event (Attribute Base_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Base_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  base a i = elementify "base" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Base_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  base a i = elementify "base" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Base_Ctor (Element locki payloadi) (Element locko payloado) where
  base a i = elementify "base" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Base_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  base a i = elementify "base" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

base_
  :: forall i o
   . Base_Ctor i o
  => i
  -> o
base_ = base empty
