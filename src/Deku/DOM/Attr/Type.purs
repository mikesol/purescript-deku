module Deku.DOM.Attr.Type where

import Prelude

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Type = Type

instance Attr AnimateTransform_ Type String where
  attr Type value = unsafeAttribute { key: "type", value: prop' value }

instance Attr FeColorMatrix_ Type String where
  attr Type value = unsafeAttribute { key: "type", value: prop' value }

instance Attr FeFuncA_ Type String where
  attr Type value = unsafeAttribute { key: "type", value: prop' value }

instance Attr FeFuncB_ Type String where
  attr Type value = unsafeAttribute { key: "type", value: prop' value }

instance Attr FeFuncG_ Type String where
  attr Type value = unsafeAttribute { key: "type", value: prop' value }

instance Attr FeFuncR_ Type String where
  attr Type value = unsafeAttribute { key: "type", value: prop' value }

instance Attr FeTurbulence_ Type String where
  attr Type value = unsafeAttribute { key: "type", value: prop' value }

instance Attr everything Type Unit where
  attr Type _ = unsafeAttribute
    { key: "type", value: unset' }
