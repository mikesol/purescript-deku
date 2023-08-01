module Deku.DOM.Attr.Cite where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Blockquote (Blockquote_)
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Q (Q_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cite = Cite

instance Attr Blockquote_ Cite String where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
  pureAttr Cite value = unsafeAttribute $ This
    { key: "cite", value: prop' value }
  unpureAttr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr Del_ Cite String where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
  pureAttr Cite value = unsafeAttribute $ This
    { key: "cite", value: prop' value }
  unpureAttr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr Ins_ Cite String where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
  pureAttr Cite value = unsafeAttribute $ This
    { key: "cite", value: prop' value }
  unpureAttr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr Q_ Cite String where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
  pureAttr Cite value = unsafeAttribute $ This
    { key: "cite", value: prop' value }
  unpureAttr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr everything Cite Unit where
  attr Cite bothValues = unsafeAttribute $ Both { key: "cite", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "cite", value: unset' })
  pureAttr Cite _ = unsafeAttribute $ This { key: "cite", value: unset' }
  unpureAttr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cite", value: unset' }
