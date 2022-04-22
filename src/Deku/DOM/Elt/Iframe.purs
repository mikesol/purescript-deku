module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Iframe_

class Iframe_Ctor i o | i -> o where
  iframe
    :: Event (Attribute Iframe_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Iframe_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  iframe a i = elementify "iframe" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Iframe_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  iframe a i = elementify "iframe" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Iframe_Ctor (Element locki payloadi) (Element locko payloado) where
  iframe a i = elementify "iframe" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Iframe_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  iframe a i = elementify "iframe" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

iframe_
  :: forall i o
   . Iframe_Ctor i o
  => i
  -> o
iframe_ = iframe empty
