module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Video_

class Video_Ctor i o | i -> o where
  video
    :: Event (Attribute Video_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Video_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  video a i = elementify "video" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Video_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  video a i = elementify "video" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Video_Ctor (Element locki payloadi) (Element locko payloado) where
  video a i = elementify "video" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Video_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  video a i = elementify "video" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

video_
  :: forall i o
   . Video_Ctor i o
  => i
  -> o
video_ = video empty
