module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Embed_

class Embed_Ctor i o | i -> o where
  embed
    :: Event (Attribute Embed_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Embed_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  embed a i = elementify "embed" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Embed_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  embed a i = elementify "embed" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Embed_Ctor (Element locki payloadi) (Element locko payloado) where
  embed a i = elementify "embed" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Embed_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  embed a i = elementify "embed" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

embed_
  :: forall i o
   . Embed_Ctor i o
  => i
  -> o
embed_ = embed empty
