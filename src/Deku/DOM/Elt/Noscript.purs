module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Noscript_

class Noscript_Ctor i o | i -> o where
  noscript
    :: Event (Attribute Noscript_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noscript_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  noscript a i = elementify "noscript" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noscript_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  noscript a i = elementify "noscript" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noscript_Ctor (Element locki payloadi) (Element locko payloado) where
  noscript a i = elementify "noscript" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Noscript_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  noscript a i = elementify "noscript" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

noscript_
  :: forall i o
   . Noscript_Ctor i o
  => i
  -> o
noscript_ = noscript empty
