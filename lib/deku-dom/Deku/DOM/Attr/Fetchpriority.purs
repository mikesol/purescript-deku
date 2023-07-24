module Deku.DOM.Attr.Fetchpriority where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)

data Fetchpriority = Fetchpriority

instance Deku.Attribute.Attr everything Fetchpriority Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fetchpriority", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Fetchpriority String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fetchpriority", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Fetchpriority String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fetchpriority", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Fetchpriority String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fetchpriority", value: _ } <<<
    Deku.Attribute.prop'
