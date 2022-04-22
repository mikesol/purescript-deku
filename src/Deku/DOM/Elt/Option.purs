module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Option_

class Option_Ctor i o | i -> o where
  option
    :: Event (Attribute Option_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Option_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  option a i = elementify "option" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Option_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  option a i = elementify "option" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Option_Ctor (Element locki payloadi) (Element locko payloado) where
  option a i = elementify "option" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Option_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  option a i = elementify "option" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

option_
  :: forall i o
   . Option_Ctor i o
  => i
  -> o
option_ = option empty
