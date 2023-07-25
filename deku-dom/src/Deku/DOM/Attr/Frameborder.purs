module Deku.DOM.Attr.Frameborder where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Iframe (Iframe_)

data Frameborder = Frameborder

instance Deku.Attribute.Attr everything Frameborder Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "frameborder", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Frameborder String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "frameborder", value: _ } <<<
    Deku.Attribute.prop'
