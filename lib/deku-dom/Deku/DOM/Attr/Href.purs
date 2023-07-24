module Deku.DOM.Attr.Href where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Use (Use_)

data Href = Href

instance Deku.Attribute.Attr everything Href Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "href", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Animate_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Base_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Image_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Mpath_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Pattern_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Use_ Href String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop'
