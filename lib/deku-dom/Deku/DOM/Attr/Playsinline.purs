module Deku.DOM.Attr.Playsinline where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Video (Video_)

data Playsinline = Playsinline

instance Deku.Attribute.Attr everything Playsinline Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "playsinline", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Video_ Playsinline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "playsinline", value: _ } <<<
    Deku.Attribute.prop'
