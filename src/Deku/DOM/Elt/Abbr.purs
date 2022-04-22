module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Abbr_

class Abbr_Ctor i o | i -> o where
  abbr
    :: Event (Attribute Abbr_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Abbr_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  abbr a i = elementify "abbr" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Abbr_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  abbr a i = elementify "abbr" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Abbr_Ctor (Element locki payloadi) (Element locko payloado) where
  abbr a i = elementify "abbr" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Abbr_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  abbr a i = elementify "abbr" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

abbr_
  :: forall i o
   . Abbr_Ctor i o
  => i
  -> o
abbr_ = abbr empty
