module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Dfn_

class Dfn_Ctor i o | i -> o where
  dfn
    :: Event (Attribute Dfn_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dfn_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  dfn a i = elementify "dfn" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dfn_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  dfn a i = elementify "dfn" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dfn_Ctor (Element locki payloadi) (Element locko payloado) where
  dfn a i = elementify "dfn" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dfn_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  dfn a i = elementify "dfn" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

dfn_
  :: forall i o
   . Dfn_Ctor i o
  => i
  -> o
dfn_ = dfn empty
