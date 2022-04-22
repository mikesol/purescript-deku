module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Nav_

class Nav_Ctor i o | i -> o where
  nav
    :: Event (Attribute Nav_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Nav_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  nav a i = elementify "nav" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Nav_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  nav a i = elementify "nav" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Nav_Ctor (Element locki payloadi) (Element locko payloado) where
  nav a i = elementify "nav" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Nav_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  nav a i = elementify "nav" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

nav_
  :: forall i o
   . Nav_Ctor i o
  => i
  -> o
nav_ = nav empty
