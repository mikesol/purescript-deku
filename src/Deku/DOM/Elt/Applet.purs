module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Applet_

class Applet_Ctor i o | i -> o where
  applet
    :: Event (Attribute Applet_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Applet_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  applet a i = elementify "applet" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Applet_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  applet a i = elementify "applet" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Applet_Ctor (Element locki payloadi) (Element locko payloado) where
  applet a i = elementify "applet" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Applet_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  applet a i = elementify "applet" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

applet_
  :: forall i o
   . Applet_Ctor i o
  => i
  -> o
applet_ = applet empty
