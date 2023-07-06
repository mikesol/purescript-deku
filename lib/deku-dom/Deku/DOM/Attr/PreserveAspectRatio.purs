module Deku.DOM.Attr.PreserveAspectRatio where

import Prelude

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PreserveAspectRatio = PreserveAspectRatio

instance Attr FeImage_ PreserveAspectRatio String where
  attr PreserveAspectRatio value = unsafeAttribute
    { key: "preserveAspectRatio", value: prop' value }

instance Attr Image_ PreserveAspectRatio String where
  attr PreserveAspectRatio value = unsafeAttribute
    { key: "preserveAspectRatio", value: prop' value }

instance Attr Marker_ PreserveAspectRatio String where
  attr PreserveAspectRatio value = unsafeAttribute
    { key: "preserveAspectRatio", value: prop' value }

instance Attr Pattern_ PreserveAspectRatio String where
  attr PreserveAspectRatio value = unsafeAttribute
    { key: "preserveAspectRatio", value: prop' value }

instance Attr Svg_ PreserveAspectRatio String where
  attr PreserveAspectRatio value = unsafeAttribute
    { key: "preserveAspectRatio", value: prop' value }

instance Attr Symbol_ PreserveAspectRatio String where
  attr PreserveAspectRatio value = unsafeAttribute
    { key: "preserveAspectRatio", value: prop' value }

instance Attr View_ PreserveAspectRatio String where
  attr PreserveAspectRatio value = unsafeAttribute
    { key: "preserveAspectRatio", value: prop' value }

instance Attr everything PreserveAspectRatio Unit where
  attr PreserveAspectRatio _ = unsafeAttribute
    { key: "preserveAspectRatio", value: unset' }
