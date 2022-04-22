module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Ol_

class Ol_Ctor i o | i -> o where
  ol
    :: Event (Attribute Ol_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ol_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  ol a i = elementify "ol" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ol_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  ol a i = elementify "ol" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ol_Ctor (Element locki payloadi) (Element locko payloado) where
  ol a i = elementify "ol" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ol_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  ol a i = elementify "ol" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

ol_
  :: forall i o
   . Ol_Ctor i o
  => i
  -> o
ol_ = ol empty
