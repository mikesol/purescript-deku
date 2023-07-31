module Deku.DOM.Attr.Target where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Link (Link_)

data Target = Target

instance Deku.Attribute.Attr everything Target Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "target", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Target String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Target String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Base_ Target String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Button_ Target String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Target String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Target String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop'
