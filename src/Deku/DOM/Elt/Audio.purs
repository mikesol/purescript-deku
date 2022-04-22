module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Audio_

class Audio_Ctor i o | i -> o where
  audio
    :: Event (Attribute Audio_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Audio_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  audio a i = elementify "audio" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Audio_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  audio a i = elementify "audio" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Audio_Ctor (Element locki payloadi) (Element locko payloado) where
  audio a i = elementify "audio" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Audio_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  audio a i = elementify "audio" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

audio_
  :: forall i o
   . Audio_Ctor i o
  => i
  -> o
audio_ = audio empty
