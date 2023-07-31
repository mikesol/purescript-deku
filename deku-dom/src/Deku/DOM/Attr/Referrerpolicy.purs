module Deku.DOM.Attr.Referrerpolicy where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)

data Referrerpolicy = Referrerpolicy

instance Deku.Attribute.Attr everything Referrerpolicy Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "referrerpolicy", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Referrerpolicy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Referrerpolicy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Referrerpolicy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Referrerpolicy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Referrerpolicy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Referrerpolicy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<<
    Deku.Attribute.prop'
