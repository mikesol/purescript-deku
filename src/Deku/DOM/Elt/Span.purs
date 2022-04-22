module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Span_

class Span_Ctor i o | i -> o where
  span
    :: Event (Attribute Span_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Span_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  span a i = elementify "span" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Span_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  span a i = elementify "span" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Span_Ctor (Element locki payloadi) (Element locko payloado) where
  span a i = elementify "span" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Span_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  span a i = elementify "span" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

span_
  :: forall i o
   . Span_Ctor i o
  => i
  -> o
span_ = span empty
