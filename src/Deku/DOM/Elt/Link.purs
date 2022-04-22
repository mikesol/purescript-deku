module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Link_

class Link_Ctor i o | i -> o where
  link
    :: Event (Attribute Link_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Link_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  link a i = elementify "link" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Link_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  link a i = elementify "link" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Link_Ctor (Element locki payloadi) (Element locko payloado) where
  link a i = elementify "link" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Link_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  link a i = elementify "link" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

link_
  :: forall i o
   . Link_Ctor i o
  => i
  -> o
link_ = link empty
