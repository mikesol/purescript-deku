module Deku.DOM.Attr.XlinkHref where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Use (Use_)

data XlinkHref = XlinkHref

instance Deku.Attribute.Attr everything XlinkHref Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "xlink:href", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeImage_ XlinkHref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:href", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Image_ XlinkHref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:href", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ XlinkHref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:href", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Pattern_ XlinkHref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:href", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ XlinkHref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:href", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ XlinkHref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:href", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Use_ XlinkHref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:href", value: _ } <<<
    Deku.Attribute.prop'
