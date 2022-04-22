module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Tt_

class Tt_Ctor i o | i -> o where
  tt
    :: Event (Attribute Tt_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tt_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  tt a i = elementify "tt" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tt_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  tt a i = elementify "tt" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tt_Ctor (Element locki payloadi) (Element locko payloado) where
  tt a i = elementify "tt" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Tt_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  tt a i = elementify "tt" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

tt_
  :: forall i o
   . Tt_Ctor i o
  => i
  -> o
tt_ = tt empty
