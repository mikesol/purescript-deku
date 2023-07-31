module Deku.DOM.Attr.Cite where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Blockquote (Blockquote_)
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Q (Q_)

data Cite = Cite

instance Deku.Attribute.Attr everything Cite Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cite", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Blockquote_ Cite String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cite", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Del_ Cite String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cite", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Ins_ Cite String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cite", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Q_ Cite String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cite", value: _ } <<< Deku.Attribute.prop'
