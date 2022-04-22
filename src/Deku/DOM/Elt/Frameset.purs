module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Frameset_

class Frameset_Ctor i o | i -> o where
  frameset
    :: Event (Attribute Frameset_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frameset_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  frameset a i = elementify "frameset" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frameset_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  frameset a i = elementify "frameset" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frameset_Ctor (Element locki payloadi) (Element locko payloado) where
  frameset a i = elementify "frameset" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Frameset_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  frameset a i = elementify "frameset" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

frameset_
  :: forall i o
   . Frameset_Ctor i o
  => i
  -> o
frameset_ = frameset empty
